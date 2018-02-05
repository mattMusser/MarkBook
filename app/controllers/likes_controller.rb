class LikesController < ApplicationController
  def index
    likes = LIke.where(user_id: current_user_id)
  end

  def create
    @topic = Topic.find(params[:topic_id])
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
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find_by(bookmark_id: @bookmark.id)

    if like.destroy
      flash[:success] = "You don't like #{@bookmark.url}"
      redirect_to @topic
    else
      flash[:error] = "We apologize but something went wrong and the bookmark wasn't unliked."
      redirect_to @topic
    end
  end
end

