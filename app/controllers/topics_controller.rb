class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      redirect_to @topic, notice: "\"#{@topic.name}\" was saved successfully."
    else
      flash.now[:alert] = "Something went wrong and the topic wasn't saved. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])

    @topic.assign_attributes(topic_params)

    if @topic.save
      flash[:notice] = "\"#{@topic.name}\" was updated."
      redirect_to @topic
    else
      flash.now[:alert] = "Something went wrong and the topic wasn't updated. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "Something went wrong and \"#{@topic.name}\" wasn't deleted."
      render :show
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title)
  end
end
