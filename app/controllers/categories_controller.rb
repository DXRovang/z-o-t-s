class CategoriesController < ApplicationController
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
