class MessagesController < ApplicationController
  def index
    @messages = Message.find_all_by_room_id(params[:room_id])

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { render json: @messages }
    end
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new
    @message.room_id = params[:room_id]
    @message.message = params[:message]
    @message.user_string = params[:user_string]

    respond_to do |format|
      if @message.save
        format.html { redirect_to root_url }
        format.json { render json: @message }
      else
        format.html { redirect_to root_url }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end
end
