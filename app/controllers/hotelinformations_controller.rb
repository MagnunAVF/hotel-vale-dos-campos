class HotelinformationsController < ApplicationController
  before_action :set_hotelinformation, only: [:home, :show, :edit, :update]

  def home
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @hotelinformation.update(hotelinformation_params)
        format.html { redirect_to @hotelinformation, notice: 'Hotelinformation was successfully updated.' }
        #format.json { render :show, status: :ok, location: @hotelinformation }
      else
        format.html { render :edit }
        #format.json { render json: @hotelinformation.errors, status: :unprocessable_entity }
      end
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
