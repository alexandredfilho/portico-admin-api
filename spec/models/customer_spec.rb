require 'rails_helper'

RSpec.describe Customer, type: :model do
  subject { create(:customer) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_uniqueness_of(:title) }
  it { is_expected.to have_many(:shipments) }
end

# == Schema Information
#
# Table name: customers
#
#  id         :bigint           not null, primary key
#  status     :string           not null
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
