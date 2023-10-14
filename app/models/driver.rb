class Driver < ApplicationRecord
  has_many :shipments
  has_many :vehicles, through: :shipments
  before_save :set_full_name

  validates_presence_of :document, :first_name, :shipping_company

  private

  def set_full_name
    self.full_name = "#{self.first_name} #{self.last_name}".strip
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
