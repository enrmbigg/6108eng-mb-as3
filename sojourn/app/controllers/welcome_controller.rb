class WelcomeController < ApplicationController
  def index
    @events = Event.all.reverse
    @articles = Article.all.reverse
  end

  def contactus
  end

  def aboutus
  end
  def club
  end
  def login
  end
  def holiday
  end
  def gallery
    @articles = Article.all.reverse
  end
end
