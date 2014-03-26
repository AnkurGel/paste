require 'net/http'
class Snippet < ActiveRecord::Base
    

  def pygmentation
    uri = URI.parse('http://pygments.appspot.com/')
    request = Net::HTTP.post_form(uri, { lang: language, code: raw })
    update_attribute(:highlighted, request.body)
  end
end
