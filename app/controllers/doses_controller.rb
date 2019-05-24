class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]

  def new
    @ingredients = Ingredient.all
    @dose = Dose.new
  end

  def create
    @ingredients = Ingredient.all
    @dose = Dose.new(doses_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
