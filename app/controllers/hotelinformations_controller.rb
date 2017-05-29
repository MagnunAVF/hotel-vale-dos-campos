class HotelinformationsController < ApplicationController
  before_action :set_hotelinformation, only: [:home, :show, :edit, :update]

  def home
  end

  def show
  end

  def edit
  end

  def update
    if @hotelinformation.update(hotelinformation_params)
      redirect_to @hotelinformation, notice: 'Informações do Hotel atualizadas com sucesso!'
    else
      render :edit
    end
  end

  private
    def set_hotelinformation
      # Hotelinformation is a Singleton, only one exists !
      @hotelinformation = Hotelinformation.all.first
    end

    def hotelinformation_params
      params.require(:hotelinformation).permit(:description, :email, :fone, :address)
    end
end
