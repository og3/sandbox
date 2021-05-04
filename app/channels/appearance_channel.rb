class AppearanceChannel < ApplicationCable::Channel
  # クライアントがサーバーに接続したと同時に実行されるメソッド
  def subscribed
    member = User.find(current_user.id)
    return unless member
    member.update_attributes(online: true, online_at: DateTime.now)
    stream_from "appearance_user"
  end

  # クライアントの接続が解除されたと同時に実行されるメソッド
  def unsubscribed
    member = User.find(current_user.id)
    return unless member
    member.update_attributes(online: false, online_at: DateTime.now)
  end
end
