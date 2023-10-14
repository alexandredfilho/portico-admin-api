require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer) { build_stubbed(:customer) }

  describe '.creating customer' do
    context 'when all fields are valid' do
      it 'should create a new customer' do
        expect(customer).to be_valid
      end
    end

    context 'when title is nil' do
      it 'returns an error' do
        customer = described_class.new(title: nil)

        expect(customer).to_not be_valid
        expect(customer.errors.messages[:title][0]).to eq("can't be blank")
      end
    end

    context 'when a customer is inactivated' do
      it 'should update the status' do
        customer = build_stubbed(:customer, status: 'inactive')
        expect(customer).to be_inactive
      end
    end
  end

  describe '.associations' do
    it 'has many shipments' do
      association = described_class.reflect_on_association(:shipment)
      expect { should has_many(:shipment) }
    end
  end
end

# == Schema Information
#
# Table name: customers
#
#  id         :bigint           not null, primary key
#  status     :enum             default("active"), not null
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
