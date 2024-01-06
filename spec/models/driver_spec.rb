# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Driver, type: :model do
  subject { create(:driver) }

  it { is_expected.to validate_presence_of(:document) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:shipping_company) }
  it { is_expected.to have_many(:shipments) }
  it { is_expected.to have_many(:vehicles) }


  context 'when a new driver is created' do
    it 'should return the full name' do
      driver = build(:driver)

      expect(driver).to be_valid
      expect(driver.full_name).to eq([driver.first_name, driver.last_name].join(' '))
    end
  end
end

# == Schema Information
#
# Table name: drivers
#
#  id               :bigint           not null, primary key
#  document         :string           not null
#  first_name       :string           not null
#  full_name        :string
#  last_name        :string
#  shipping_company :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
