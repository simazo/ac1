class RoomChannel < ApplicationCable::Channel
  def subscribed
    logger.debug("RoomChannel subscribed")
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    #ブロードキャスト処理を削除し、
    #ActionCable.server.broadcast 'room_channel', {message: data['message']}

    #DB登録に変えた　そのためブロードキャスト処理はjobで行う
    Message.create! content: data['message']
  end
end
