class AppearanceChannel < ApplicationCable::Channel
  # クライアントがサーバーに接続したと同時に実行されるメソッド
  def subscribed
    set_member
    return unless @member
    broadcast_online_status(before_online_status: @member.online, after_online_status: true)
    stream_from "appearance_user"
  end

  # クライアントの接続が解除されたと同時に実行されるメソッド
  def unsubscribed
    set_member
    return unless @member
    broadcast_online_status(before_online_status: @member.online, after_online_status: false)
  end

  private
  def broadcast_online_status(before_online_status:, after_online_status:)
    @member.update_attributes(online: after_online_status, online_at: DateTime.now)
    if before_online_status != @member.online
      AppearanceBroadcastJob.perform_later(@member)
    end
  end

  def set_member
    @member = User.find(current_user.id)
  end
end
