class LikesController < ApplicationController
  def index
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    if like.save
      flash[:success] = "You like #{@bookmark.url}"
      redirect_to @topic
    else
      flash[:failure] = "We apologize but something went wrong and the bookmark wasn't liked."
      redirect_to @topic
    end
  end

  def destroy
    bookmark = Bookmark.find(params[:bookmark_id]
    like = current_user.likes.find(params[:id])

    if like.destroy
      flash[:success] = "You don't like #{@bookmark.url}"
      redirect_to @topic
    else
      flash[:error] = "We apologize but something went wrong and the bookmark wasn't unliked."
      redirect_to @topic
    end
  end
end

