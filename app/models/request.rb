class Request < ApplicationRecord
  belongs_to :user

  enum method: [:get, :post], _suffix: true

  validates :method, :requestable_type, :user, presence: true
  validates :requestable_type, inclusion: { in: %w(Job) }
end
