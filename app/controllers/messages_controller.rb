class MessagesController < ApplicationController
before_action :signed_in_user
  def create
    @message = current_user.messages.build(message_params)
    if current_user.save
      redirect_to :back
    end

  end

  def destroy
    message = Message.find(params[:id])
    if message.save
      redirect_to :back
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :room_id)
  end

  def signed_in_user
   redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end
end

end
