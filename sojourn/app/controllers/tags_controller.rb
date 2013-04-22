class TagsController < ApplicationController
  before_filter :require_login, only: [:destroy]
  def index
  	@tags = Tag.all
  end

  def show
		@tag = Tag.find(params[:id])
	end
	# DELETE /articles/1.json
 	def destroy
	  @tag = Tag.find(params[:id])
	  @Tag.destroy
	end
end
