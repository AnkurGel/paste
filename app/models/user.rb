class User < ActiveRecord::Base
  extend FriendlyId

  before_save { self.username = username.downcase }

  has_many :snippets, dependent: :destroy
  validates :username, presence: true, uniqueness: { scope: :provider }

  def self.from_github(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.username = auth.extra.raw_info.login
      user.save!
    end
  end

  def pastes
    snippets
  end

  def gists
  end

  friendly_id :username
end
