class MessagesController < ApplicationController
  before_action :require_user
  def create
    message = current_user.messages.build(message_params)
    if message.save

      ActionCable.server.broadcast "chatroom_channel",
        is_your: (current_user==message.user)? true : false,
        owner: current_user.username, msg: message.body,
        time: Time.parse(message.created_at.to_s).strftime('%d/%m/%Y') + ' - ' +
        Time.parse(message.created_at.to_s).strftime('%H:%M h')

      #redirect_to root_path

      # render partial instead of creatin on js
      # ActionCable.server.broadcast "chatroom_channel",
      #  mod_message: message_render(message)

    end
  end
  
  private

  def message_params
    params.require(:message).permit(:body)
  end

  def message_render(message)
    render(partial: 'message', locals: {message: message})
  end
end