class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
    @users = User.all
    @accounts = Account.all
  end

  def show
    @transaction = Transaction.find(params[:id])
    @account = Account.find(@transaction.account_id)
    @user = User.find(@account.user_id)
    @NOMINALS = [100, 50, 20, 10, 5, 1]
    @bill_types = []
      def dispense(amount)
        @NOMINALS.each do |denomination|
          @bill_types.push([amount/denomination, denomination])
          amount = amount % denomination
        end
        return @bill_types
      end
      @response = dispense(@transaction.amount).delete_if {|item| item[0].zero?}
      #@account.total -= @transaction.amount
      #@account.save
  end
  def new
      @users = User.all
      @options =  Account.all.collect {|account| ["#{@users.find(account.user_id).name} " + "Account Number " + "#{account.id}", account.id]}
  end

  def create
    @transaction = Transaction.new(user_params)

    @transaction.save
    redirect_to @transaction
  end

  private
  def user_params
    params.require(:transaction).permit(:amount, :account_id)
  end
end
