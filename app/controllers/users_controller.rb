class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    @clients = Client.all
    @employees = Employee.all
  end

  def show
  end

  def search_client
  end

  def search_client_results
    @clients = Client.where(cpf: params[:cpf], type: "Client").order(created_at: :asc)
  end

  def new
    @user = User.new
    @type = params[:type]
  end

  def edit
    @type = params[:type]
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'Usuário criado com sucesso.'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Usuário atualizado co sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'Usuário deletado com sucesso.'
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :cpf, :address, :birthday, :email, :fone, :type, :registrationID)
    end
end
