require 'rails_helper'

RSpec.describe Pass, type: :model do
  it { should validate_presence_of :visitor_firstname }
  it { should validate_presence_of :visitor_lastname }
  it { should validate_presence_of :visitor_company }
  it { should validate_presence_of :visit_date }
end
