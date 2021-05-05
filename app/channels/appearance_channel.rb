class AppearanceChannel < ApplicationCable::Channel
  # クライアントがサーバーに接続したと同時に実行されるメソッド
  def subscribed
    member = User.find(current_user.id)
    return unless member
    before_member_online_status = member.online
    member.update_attributes(online: true, online_at: DateTime.now)
    if before_member_online_status != member.online
      AppearanceBroadcastJob.perform_later(member)
    end
    stream_from "appearance_user"
  end

  # クライアントの接続が解除されたと同時に実行されるメソッド
  def unsubscribed
    member = User.find(current_user.id)
    return unless member
    before_member_online_status = member.online
    member.update_attributes(online: false, online_at: DateTime.now)
    if before_member_online_status != member.online
      AppearanceBroadcastJob.perform_later(member)
    end
  end
end
