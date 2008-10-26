class TopicsController < ApplicationController
  
  # GET /topics
  def index
    @topics = Topic.find(:all)
  end

  # GET /topics/1
  def show
    @topic = Topic.find(params[:id])
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
  end

  # POST /topics
  def create
    @topic = Topic.new(params[:topic])
    respond_to do |format|
      if @topic.save
        flash[:notice] = 'Topic was successfully created.'
        # redirect_to(@topic)
        format.html { redirect_to edit_meeting_path(@topic.meeting_id) }
        format.js
      else
        render :action => "new"
      end
    end
  end

  # PUT /topics/1
  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(params[:topic])
      flash[:notice] = 'Topic was successfully updated.'
      redirect_to(@topic)
    else
      render :action => "edit"
    end
  end

  # DELETE /topics/1
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to(topics_url)
  end
end
