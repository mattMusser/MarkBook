class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)
    @bookmark.user = current_user

    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
      redirect_to [@topic, @bookmark]
    else
      flash.now[:alert] = "Something went wrong and your bookmark wasn't saved."
      render :new
    end
  end

  def edit
    
  end

  def update
  end

  def destroy
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
