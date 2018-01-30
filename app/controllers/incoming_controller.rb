class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # You put the message-splitting and business
    # magic here.
    # Find the user by using params[:sender]
    @user = User.where(email: params[:sender])
    # Find the topic by using params[:subject]
    @topic = Topic.where(title: params[:subject])
    # Assign the url to a variable after retrieving it from params["body-plain"]
    @url = params["body-plain"]
    # Check if user is nil, if so, create and save a new user
    if @user.nil?
      @user = User.create!(username: "Default", email: params[:sender], password: "changeme")
    end
    #Check if user the topic is nil, if so, create and save a new topic
    if @topic.nil?
      @topic = Topic.create!(title: params[:subject], user: @user)
    end
    #now that you're sure you have a valid user and topic, build and save a new bookmark
    @bookmark = @topic.bookmarks.create!(url: @url, user: @user)
    # Assuming all went well
    head 200
  end
end
