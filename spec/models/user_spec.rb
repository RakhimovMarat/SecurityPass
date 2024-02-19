require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:passes) }
  it { should have_one(:role) }
end
