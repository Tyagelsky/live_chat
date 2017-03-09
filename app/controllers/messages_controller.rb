class MessagesController < ApplicationController
before_action :signed_in_user

  def create
      @message = current_user.messages.create(message_params)
      Room.find(params[:message][:room_id]).messages.push(@message)
      if @message
      redirect_to :back
      end

  end

  def destroy
    @message = Message.find(params[:id])
    if @message.destroy
      flash[:notice] = 'Message deleted.'
      redirect_to :back
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :id)
  end

  def signed_in_user
   redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end
end
