class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions
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
