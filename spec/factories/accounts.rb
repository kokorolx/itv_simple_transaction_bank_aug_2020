FactoryBot.define do
  factory :account do
    name { "MyString" }
    address { "MyString" }
    bank { "MyString" }
    user { create(:user) }
  end
end

# == Schema Information
#
# Table name: accounts
#
#  id         :bigint           not null, primary key
#  address    :string
#  bank       :string
#  deleted_at :datetime
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
