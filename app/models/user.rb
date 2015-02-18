require 'bcrypt'

class User < ActiveRecord::Base
  has_and_belongs_to_many :events
  has_secure_password
end
