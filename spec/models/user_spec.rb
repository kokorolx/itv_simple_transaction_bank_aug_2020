require 'rails_helper'

RSpec.describe User, type: :model do
  describe "association" do
    it { should have_many(:accounts) }
  end

  describe "valid?" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

end

# == Schema Information
#
# Table name: accounts
#
#  id         :bigint           not null, primary key
#  address    :string
#  bank       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_accounts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
