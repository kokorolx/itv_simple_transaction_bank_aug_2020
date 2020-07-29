require 'rails_helper'

RSpec.describe Account, type: :model do
  describe "association" do
    it { should belong_to(:user) }
    it { should have_many(:transactions) }
  end

  it "valid bank?" do
    should define_enum_for(:bank).
      with_values(
        vcb: "VCB", acb: "ACB", vib: "VIB"
      ).
      backed_by_column_of_type(:string)
  end

  describe "valid?" do
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:bank) }
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
