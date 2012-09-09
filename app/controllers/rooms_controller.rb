class RoomsController < ApplicationController
  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @room = Room.find_by_room_string(params[:id])
    @messages = Message.find_all_by_room_id(@room.id)
    @user_string = random_string

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @room }
    end
  end

  # GET /rooms/new
  # GET /rooms/new.json
  def new
    @room = Room.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @room }
    end
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(params[:room])
    @room.room_string = random_string

    respond_to do |format|
      if @room.save
        format.html { redirect_to room_path(@room.room_string), notice: 'Room was successfully created.' }
        format.json { render json: @room, status: :created, location: @room }
      else
        format.html { render action: "new" }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end
end
