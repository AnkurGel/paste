class User < ActiveRecord::Base
  def self.from_github(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.username = auth.extra.raw_info.login
      user.save!
    end
  end
end
