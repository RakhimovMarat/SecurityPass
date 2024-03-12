# frozen_string_literal: true

class Role < ApplicationRecord
  validates :rolename, presence: true
  validates :user_id,  presence: true

  has_many :users
end
