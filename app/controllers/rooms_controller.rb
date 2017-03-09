class RoomsController < ApplicationController
  before_action :signed_in_user

  def index
    @rooms=Room.all
  end

  def show
    @room = Room.find_by({name: params[:id]}) || Room.find(params[:id])
    @messages = @room.messages
    @message = Message.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = 'Room was successfully created.'
      redirect_to @room
    else
      render 'new'
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = 'Room was successfully destroyed.'
    redirect_to rooms_path
  end

  private

    def room_params
      params.require(:room).permit(:name)
    end

    def signed_in_user
     redirect_to signin_url, notice: "Please sign in." unless signed_in?
   end

end
