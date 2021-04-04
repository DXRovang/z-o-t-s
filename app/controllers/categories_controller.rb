class CategoriesController < ApplicationController
  before_action(:require_login)

  def index
    # binding.pry
    @categories = Category.all
    @family = Family.find_by(id: params[:family_id])
    if params[:category]
      @instruments = Instrument.category_search(params[:category][:category_id])
    else
      @instruments = []
    end
  end

  def show
  end
end
