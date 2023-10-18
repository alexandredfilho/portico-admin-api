require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build_stubbed(:user)}

  describe '.creating user' do
    context 'when all fields are valid' do
      it 'should create user' do
        expect(user).to be_valid
      end
    end

    context 'when email is nil' do
      it 'should not create user' do
        user = described_class.new(email: nil, password: "VerySecure", password_confirmation: "VerySecure")

        expect(user).to_not be_valid
        expect(user.errors.messages[:email][0]).to eq("can't be blank")
      end
    end

    context 'when password is nil' do
      it 'should not create user' do
        user = described_class.new(email: "email@test.com", password: nil, password_confirmation: nil)

        expect(user).to_not be_valid
        expect(user.errors.messages[:password][0]).to eq("can't be blank")
      end
    end
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  jti                    :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default("user")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_jti                   (jti) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
