require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe "association" do
    it { should belong_to(:account) }
  end

  it "valid transaction_type?" do
    should define_enum_for(:transaction_type).
      with_values(
        withdraw: "withdraw", deposit: "deposit"
      ).
      backed_by_column_of_type(:string)
  end

  describe "valid?" do
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:transaction_type) }
    it { should validate_numericality_of(:amount).is_greater_than(0) }
  end


end

# == Schema Information
#
# Table name: transactions
#
#  id               :bigint           not null, primary key
#  amount           :decimal(, )
#  deleted_at       :datetime
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
