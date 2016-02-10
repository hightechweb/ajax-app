class UsersController < ApplicationController

  def my_posts
    # @user = User.new
    @user = current_user
  end

end