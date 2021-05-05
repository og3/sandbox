class AppearanceBroadcastJob < ApplicationJob
  queue_as :default

  def perform(user)
    # jsonをappearance_userチャンネルに送信する
    ActionCable.server.broadcast "appearance_user", user.to_json
  end
end
