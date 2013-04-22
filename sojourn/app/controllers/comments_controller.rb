class CommentsController < ApplicationController
before_filter :require_login, except: [:create]
def create
  article_id = params[:comment].delete(:article_id)
  @comment = Comment.new(params[:comment])
  @comment.article_id = article_id
  @comment.save
 flash[:notice] = "Thanks for commenting!"
  respond_to do |format|
    format.html { redirect_to article_path(@comment.article) }
    format.js
  
end

end
end
