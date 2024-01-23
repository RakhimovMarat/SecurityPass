class Pass < ApplicationRecord
  validates :visitor_firstname, presence: true
  validates :visitor_lastname,  presence: true
  validates :visit_date,        presence: true

  enum :status, { created: 0, approved: 1, rejected: 2, finished: 3, canceleld: 4 }, default: :created
end
