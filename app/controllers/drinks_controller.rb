class DrinksController < ApplicationController
  # before_action :set_drink, only: [:show, :destroy]

  def index
    @drinks = Drink.all
  end

  def show
    @drink = Drink.find(params[:id])
  end

  def new
    @drink = Drink.new
  end

  def create
    @drink = Drink.new(Drink_params)

    respond_to do |format|
      if @drink.save
        format.html { redirect_to @drink, notice: 'Drink was successfully created.' }
        format.json { render action: 'show', status: :created, location: @drink }
      else
        format.html { render action: 'new' }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @drink = Drink.find(params[:id])
    @drink.destroy
    respond_to do |format|
      format.html { redirect_to drinks_url }
      format.json { head :no_content }
    end
  end


  private
  # # Use callbacks to share common setup or constraints between actions.
  # def set_drink
  #   @drink = Drink.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def drink_params
    params.require(:drink).permit(:alcohol, :mixer, :finish, :over_ice, :top_shelf, :price)
  end
end