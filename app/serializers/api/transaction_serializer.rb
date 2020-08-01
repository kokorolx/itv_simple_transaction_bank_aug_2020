class Api::TransactionSerializer < ActiveModel::Serializer
  attributes :id,
             :account_id,
             :amount,
             :transaction_type,
             :created_at

  attributes :bank

  def bank
    return if object.account.blank?
    object.account.bank
  end
end
