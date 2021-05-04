class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    member = User.find(current_user.id)
    return unless member
    member.update_attributes(online: true, online_at: DateTime.now)
    stream_from "appearance_user"
  end

  def unsubscribed
    member = User.find(current_user.id)
    return unless member
    member.update_attributes(online: false, online_at: DateTime.now)
  end
end
