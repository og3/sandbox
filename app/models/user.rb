class User < ApplicationRecord
  # devise機能全部盛り
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable
end
