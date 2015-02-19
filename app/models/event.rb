class Event < ActiveRecord::Base
  has_many :votes
  has_many :options

  belongs_to :user

  def time_since_creation
    self.created_at.strftime("%B %d, %Y, %l:%M")
  end
end
