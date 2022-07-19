class Todo < ApplicationRecord
  enum status: [:waiting, :done, :in_progress, :failed]
  enum priority: [:low, :high, :critical]
end
