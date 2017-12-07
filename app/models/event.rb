class Event < ApplicationRecord
  belongs_to :user
  has_many   :tasks, inverse_of: :event
  accepts_nested_attributes_for :tasks
end
