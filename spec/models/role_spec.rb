require 'rails_helper'

RSpec.describe Role, type: :model do
  it { should validate_presence_of :rolename }
  it { should belong_to(:user) }
  it { should validate_presence_of :user_id }

  describe 'Enums' do
    it { is_expected.to define_enum_for(:rolename).with_values(
                                                              user: 0,
                                                              guard: 1,
                                                              admin: 2,
                                                              )
       }
    #it { is_expected.to have_enum_default_value(:rolename, :user) }
  end
end
