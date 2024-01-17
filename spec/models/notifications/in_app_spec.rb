require 'rails_helper'

RSpec.describe Notifications::InApp, :model do
  it { is_expected.to belong_to(:user) }
end
