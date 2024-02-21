require 'rails_helper'

RSpec.describe Role, type: :model do
  it { should validate_presence_of :rolename }
  it { should belong_to(:user) }
  it { should validate_presence_of :user_id }

  end
end
