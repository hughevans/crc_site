class MeetingsController < ApplicationController

  # GET /meetings
  def index
    upcoming_meetings = Meeting.future
    @next_meeting = upcoming_meetings.shift   # removes the next meeting from upcoming_meetings
    @future_meetings = upcoming_meetings
    @past_meetings = Meeting.past
  end

  # GET /meetings/1
  def show
    @meeting = Meeting.find(params[:id])
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
  end

  # GET /meetings/1/edit
  def edit
    @meeting = Meeting.find(params[:id])
  end

  # POST /meetings
  def create
    @meeting = Meeting.new(params[:meeting])
    if @meeting.save
      flash[:notice] = 'Meeting was successfully created.'
      redirect_to(@meeting)
    else
      render :action => "new"
    end
  end

  # PUT /meetings/1
  def update
    @meeting = Meeting.find(params[:id])
    if @meeting.update_attributes(params[:meeting])
      flash[:notice] = 'Meeting was successfully updated.'
      redirect_to(@meeting)
    else
      render :action => "edit"
    end
  end

  # DELETE /meetings/1
  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    redirect_to(meetings_url)
  end
end
