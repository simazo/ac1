class Message < ApplicationRecord
    #データ保存後にMessageBroadcastJobのperformメソッドを実行する
    after_create_commit { MessageBroadcastJob.perform_later self }
end
