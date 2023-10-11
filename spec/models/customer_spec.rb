# == Schema Information
#
# Table name: customers
#
#  id          :bigint           not null, primary key
#  description :string
#  status      :enum             default("active"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "rails_helper"

RSpec.describe Customer, type: :model do
  let(:customer) { described_class.new(description: "Customer") }
  describe ".creating customer" do
    context "when all fields are valid" do
      it "should create a new customer" do
        expect(customer).to be_valid
      end
    end

    context "when description is nil" do
      it "returns an error" do
        customer = described_class.new(description: nil)
        expect(customer).to_not be_valid
      end
    end

    context "when a customer is inactivated" do
      it "should update the status" do
        customer.update(status: "inactive")
        expect(customer).to be_inactive
      end
    end
  end

  describe ".associations" do
    it "has many shipments" do
      association = described_class.reflect_on_association(:shipment)
      expect { should has_many(:shipment) }
    end
  end
end
