class AuthorSessionsController < ApplicationController
  def new
    @author = Author.new
  end
 
  def create
    @author = login(params[:username], params[:password])
    if @author
      redirect_back_or_to(welcome_index_path, message: 'Logged in successfully.')
    else
      flash.now.alert = "Login failed."
      render action: :new
    end
  end
 
  def destroy
    logout
    redirect_to(:authors, message: 'Logged out!')
  end
end
