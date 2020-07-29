FactoryBot.define do
  factory :transaction do
    account { create(:account) }
    amount { "9.99" }
    transaction_type { "MyString" }
  end
end

# == Schema Information
#
# Table name: transactions
#
#  id               :bigint           not null, primary key
#  amount           :decimal(, )
#  transaction_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  account_id       :bigint           not null
#
# Indexes
#
#  index_transactions_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
