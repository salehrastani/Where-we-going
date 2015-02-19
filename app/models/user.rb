require 'bcrypt'

class User < ActiveRecord::Base
  has_many :events
  has_many :votes

  validates :username, :password, :name, presence: true
  validates :username, uniqueness: true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
