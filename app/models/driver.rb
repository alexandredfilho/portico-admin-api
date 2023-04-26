class Driver < ApplicationRecord
  has_many :shipments
  has_many :vehicles, through: :shipments
  before_save :set_full_name

  private

  def set_full_name
    self.full_name = "#{self.first_name} #{self.last_name}".strip
  end
end
