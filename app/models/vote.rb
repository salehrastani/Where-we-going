class Votes < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  belongs_to :option
end