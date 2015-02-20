class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  belongs_to :option

  validates :user_id, :event_id, uniqueness: true
end
