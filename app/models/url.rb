
require 'securerandom'
# require_relative '../../config/database'
# require_relative '../../config/environment'


class Url < ActiveRecord::Base
  validates :long_url, presence: true
  validates :long_url, uniqueness:true
  validates :long_url, format: { with: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix ,  message: "The input string is not a valid URL"}
  validates :long_url, length: { minimum: 4 }
  


    def shorten
    	short_url = SecureRandom.urlsafe_base64(5)
    	self.short_url = short_url
    	self.click_count = 0


    end
end


