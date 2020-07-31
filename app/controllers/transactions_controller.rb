class TransactionsController < ApplicationController
  before_action :set_account
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = @account.transactions.page(params[:page])
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    ActiveRecord::Base.transaction do
      @transaction = @account.transactions.new(transaction_params)

      respond_to do |format|
        if @transaction.save
          format.html { redirect_to account_transaction_path(@account, @transaction), notice: 'Transaction was successfully created.' }
          format.json { render :show, status: :created, location: @transaction }
        else
          format.html { render :new, alert: 'Transaction was unsuccessfully created.' }
          format.json { render json: @transaction.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      ActiveRecord::Base.transaction do
        if @transaction.update(transaction_params)
          format.html { redirect_to account_transaction_path(@account, @transaction), notice: 'Transaction was successfully updated.' }
          format.json { render :show, status: :ok, location: @transaction }
        else
          format.html { render :edit, alert: 'Transaction was unsuccessfully created.' }
          format.json { render json: @transaction.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    ActiveRecord::Base.transaction do
      @transaction.soft_delete
    end
    respond_to do |format|
      format.html { redirect_to account_transactions_path(@account), notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    def set_account
      @account = Account.find(params[:account_id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:account_id, :amount, :transaction_type)
    end
end
