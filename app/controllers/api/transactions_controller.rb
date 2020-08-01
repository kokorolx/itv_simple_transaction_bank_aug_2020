class Api::TransactionsController < Api::BaseController

  def index
    transactions = User.find(params[:user_id]).transactions
    render_list(list: transactions, serializer: Api::TransactionSerializer)
  end

  def create
    user = User.find(params[:user_id])
    account = user.accounts.find(transaction_params[:account_id])
    ActiveRecord::Base.transaction do
      transaction = account.transactions.new(transaction_params)
      if transaction.save
        render_success(data: transaction, serializer: Api::TransactionSerializer)
      else
        render :new, alert: 'Transaction was unsuccessfully created.'
      end
    end
  end

  private
  def transaction_params
    params.require(:transactions).permit(:account_id,
                                        :amount,
                                        :transaction_type)
  end
end
