class HomeController < ApplicationController

  def index
    # redirect logged in users to a page to view thier posts
    if current_user
      redirect_to posts_path
    end
  end

end
