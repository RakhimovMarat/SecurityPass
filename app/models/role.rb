class Role < ApplicationRecord
  validates :rolename, presence: true
  validates :user_id,  presence: true

  belongs_to :user

  enum :rolename, { user: 0, guard: 1, admin: 2 }, default: :user
end
