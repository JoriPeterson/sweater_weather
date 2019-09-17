class User < ApplicationRecord
  require 'securerandom'
  has_secure_password

  validates_presence_of :email
  validates_presence_of :password

  def self.api_key
    SecureRandom.hex 11
  end
end
