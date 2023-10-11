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
require "rails_helper"

RSpec.describe Driver, type: :model do
  let(:driver) do
    described_class.new(
      document: "123456789",
      first_name: "Han",
      last_name: "Solo",
      shipping_company: "XPTO",
    )
  end

  describe ".creating driver" do
    context "when all fields are valid" do
      it "should create a new driver" do
        expect(driver).to be_valid
      end
    end
  end

  context "when document is nil" do
    it "should return an error" do
      driver =
        described_class.new(
          document: nil,
          first_name: "Han",
          shipping_company: "XPTO",
        )
      expect(driver).to_not be_valid
    end
  end

  context "when first name is nil" do
    it "should return an error" do
      driver =
        described_class.new(
          document: "123456789",
          first_name: nil,
          shipping_company: "XPTO",
        )
      expect(driver).to_not be_valid
    end
  end

  describe ".associations" do
    it "has many shipments" do
      association = described_class.reflect_on_association(:shipment)
      expect { should has_many(:shipment) }
    end

    it "has many vehicles" do
      association = described_class.reflect_on_association(:vehicles)
      expect { should has_many(:vehicles) }
    end
  end
end
