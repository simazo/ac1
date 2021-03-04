class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    #ブロードキャスト処理
    ActionCable.server.broadcast 'room_channel', {message: render_message(message)}
  end

  def render_message(message)
    #パーシャルにレンダリング
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end

end
