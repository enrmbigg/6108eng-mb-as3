require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
test "article title are correct" do

   article = Article.new(:title => "Testing",
                          :body => "This is a test",
                          :image_url => "test.jpg")
  
    article.title == "Testing"
  
  end

end
