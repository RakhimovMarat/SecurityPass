require 'rails_helper'

RSpec.describe Pass, type: :model do
  it { should validate_presence_of :visitor_firstname }
  it { should validate_presence_of :visitor_lastname }
  it { should validate_presence_of :visit_date}

  describe 'Enums' do
    it { is_expected.to define_enum_for(:status).with_values(
                                                            created: 0,
                                                            approved: 1,
                                                            rejected: 2,
                                                            finished: 3,
                                                            canceleld: 4,
                                                            )
       }
    #it { is_expected.to have_enum_default_value(:status, :created) }
  end
end
