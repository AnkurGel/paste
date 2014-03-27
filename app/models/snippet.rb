require 'net/http'
class Snippet < ActiveRecord::Base
  extend FriendlyId

  default_scope -> { order("created_at DESC") }

  belongs_to :user
  after_create :generate_base36

  def pygmentation
    uri = URI.parse('http://pygments.appspot.com/')
    request = Net::HTTP.post_form(uri, { lang: language, code: raw })
    update_attribute(:highlighted, request.body)
  end

  friendly_id :slug
  private
  def generate_base36
    update_attributes(slug: (1000+id).to_s(2).to_i.to_s(36))
  end
end
