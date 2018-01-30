class BookmarksController < ApplicationController
  authorize :bookmark, :show?

  def show
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    redirect_to @bookmark.url
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)
    @bookmark.user = current_user
    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
      redirect_to [@topic]
    else
      flash.now[:alert] = "Something went wrong and your bookmark wasn't saved. Please try again."
      render :new
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.assign_attributes(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark was updated."
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash.now[:alert] = "Something went wrong and the bookmark wasn't saved. Please try again."
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
      redirect_to @bookmark.topic
    else
      flash[:alert] = "Something went wrong and the bookmark wasn't saved."
      render :show
    end
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
