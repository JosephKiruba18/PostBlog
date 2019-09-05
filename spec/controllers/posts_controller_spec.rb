require "rails_helper"

RSpec.describe PostsController , type: 'controller' do 
  describe '#index' do
    it "shows all files in DESC order" do
      # post_controller = PostsController.new
      # expect(post_controller.index).to_eq 
      controller.prepend_view_path 'app/views'
      get :index
      expect(response).to render_template("index")
    end
  end

  describe '#create' do
    it "responds to custom formats when provided in the params"do
      # params = { post: {} }
      #byebug
      #post :create, post: attributes_for(:post)
      post :create, { :post => {:title => 'test', :body => 'body', :author => 'Tony'} }
      expect(response.content_type).to eq "text/html"
      expect(Post.count).to eq(1)
    end
  end

  describe '#show' do
    it "should show post" do
      new1 = FactoryBot.create(:post, title: 'title', author: "author")
      byebug
      get :show, params: {id: new1.id}
      #byebug
      #get :show, { id: @post_controller.to_param, template: 'post/show' }
      expect(assigns(:posts).title).to eq(new1.title)
      expect(assigns(:posts).author).to eq(new1.author)
    end

  end

end
