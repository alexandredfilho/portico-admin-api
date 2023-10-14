# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Driver, type: :model do
  let(:driver) { build_stubbed(:driver) }

  describe '.creating driver' do
    context 'when all fields are valid' do
      it 'should create a new driver' do
        expect(driver).to be_valid
      end
    end
  end

  context 'when document is nil' do
    it 'should return an error' do
      driver = build_stubbed(:driver, document: nil)

      expect(driver).to_not be_valid
      expect(driver.errors.messages[:document][0]).to eq("can't be blank")
    end
  end

  context 'when first name is nil' do
    it 'should return an error' do
      driver = build_stubbed(:driver, first_name: nil)

      expect(driver).to_not be_valid
      expect(driver.errors.messages[:first_name][0]).to eq("can't be blank")
    end
  end

  context 'when shipping company is nil' do
    it 'should return an error' do
      driver = build_stubbed(:driver, shipping_company: nil)

      expect(driver).to_not be_valid
    end
  end

  context 'when a new driver is created' do
    it 'should return the full name' do
      driver = create(:driver)

      expect(driver).to be_valid
      expect(driver.full_name).to eq([driver.first_name, driver.last_name].join(' '))
    end
  end

  describe '.associations' do
    it 'has many shipments' do
      described_class.reflect_on_association(:shipment)
      expect { should has_many(:shipment) }
    end

    it 'has many vehicles' do
      described_class.reflect_on_association(:vehicles)
      expect { should has_many(:vehicles) }
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
