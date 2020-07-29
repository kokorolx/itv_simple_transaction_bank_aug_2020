class Transaction < ApplicationRecord
  belongs_to :account
  enum transaction_type: { withdraw: "withdraw", deposit: "deposit" }

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :transaction_type, presence: true
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
