class AccountsController < ApplicationController
  def index
    @accounts = Account.all
    @users = User.all
  end

  def show
    @account = Account.find(params[:id])
  end

  def new
    @options =  User.all.collect {|user| [user.name, user.id]}
  end

  def create
    @account = Account.new(account_params)
    @account.save
    redirect_to @account
  end



  private
  def account_params
    params.require(:account).permit(:user_id, :total)
  end

end
