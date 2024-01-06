class Pass < ApplicationRecord
  validates :visitor_firstname, presence: true
  validates :visitor_lastname,  presence: true
  validates :visitor_company,   presence: true
  validates :visit_date,        presence: true
end
