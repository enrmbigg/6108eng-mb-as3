require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
def new_article
   article = Article.new(:title => "Testing",
                          :body => "This is a test",
                          :image_url => "test.jpg")
end
  test "article title are correct" do
    article.title == "Testing"
  
  end

end
