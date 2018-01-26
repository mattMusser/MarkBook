class IncomingController < ApplicationController
  # # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # You put the message-splitting and business
    # magic here.
      # Find the user by using params[:sender]
      @user = params[:sender]
      # Find the topic by using params[:subject]
      @topic = params[:subject]
      # Assign the url to a variable after retrieving it from params["body-plain"]
      @url = params["body-plain"]
      # Check if user is nil, if so, create and save a new user
      if user.nil?
        @user = User.new(params[:sender])
        @user.save
      end
      #Check if user the topic is nil, if so, create and save a new topic
      if @topic.nil?
        @topic = Topic.new(params[:subject])
        @topic.save
      end
      #now that you're sure you have a valid user and topic, build and save a new bookmark
      @bookmark = @topic.bookmarks.build(bookmark_params)
      @bookmark.save

    head 200
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end 
