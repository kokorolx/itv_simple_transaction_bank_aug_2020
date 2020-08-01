class TransactionsController < BaseController
  before_action :set_account
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /accounts/:account_id/transactions
  def index
    @transactions = @account.transactions.page(params[:page])
  end

  # GET /accounts/:account_id/transactions/1
  def show
  end

  # GET /accounts/:account_id/transactions/new
  def new
    @transaction = @account.transactions.new
  end

  # GET /accounts/:account_id/transactions/1/edit
  def edit
  end

  # POST /accounts/:account_id/transactions
  def create
    ActiveRecord::Base.transaction do
      @transaction = @account.transactions.new(transaction_params)
      if @transaction.save
        redirect_to account_transaction_path(@account, @transaction), notice: 'Transaction was successfully created.'
      else
        render :new, alert: 'Transaction was unsuccessfully created.'
      end
    end
  end

  # PATCH/PUT /accounts/:account_id/transactions/1
  def update
    ActiveRecord::Base.transaction do
      if @transaction.update(transaction_params)
        redirect_to account_transaction_path(@account, @transaction), notice: 'Transaction was successfully updated.'
      else
        render :edit, alert: 'Transaction was unsuccessfully created.'
      end
    end
  end

  # DELETE /accounts/:account_id/transactions/1
  def destroy
    ActiveRecord::Base.transaction do
      if @transaction.soft_delete
        redirect_to account_transactions_path(@account), notice: 'Transaction was successfully destroyed.'
      else
        redirect_to account_transactions_path(@account), notice: 'Transaction was unsuccessfully destroyed.'
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = @account.transactions.find(params[:id])
    end

    def set_account
      @account = current_user.accounts.find(params[:account_id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:account_id, :amount, :transaction_type)
    end
end
