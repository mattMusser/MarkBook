class UsersController < ApplicationController
  def index
    @users = User.all
    # for future admin access to list of all users
  end

  def show
    @user_bookmarks = current_user.bookmarks
    @liked_bookmarks = current_user.liked_bookmarks
  end
end
