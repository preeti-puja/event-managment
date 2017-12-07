class Task < ApplicationRecord
  belongs_to :event, inverse_of: :tasks
end
