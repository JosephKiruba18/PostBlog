require 'rails_helper'
RSpec.describe Post, :type => :model do 
  describe 'Post' do
  	it "is not valid without a author" do
    	post = Post.new(title: nil, author: nil)
    	expect(post).to_not be_valid
    end

    it "is valid if the author is present" do
      post = Post.new(author: 'kiruba')
    	expect(post).to be_valid
    end
  end
end
	 	