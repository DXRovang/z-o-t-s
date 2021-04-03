class InstrumentsController < ApplicationController
  before_action(:require_login)
  before_action :set_instrument, only: [:show, :edit, :update, :destroy]
  
    def index
      @instruments = Instrument.all
    end
  
    def new
      @instrument = Instrument.new 
      @family = Family.find_by(id: params[:family_id])
    end
  
    def create
      @instrument = Instrument.new(instrument_params)
      @instrument.user_id = current_user.id
      # binding.pry
      if @instrument.save 
        redirect_to instrument_path(@instrument)
      else
        @family = Family.find_by(id: instrument_params[:family_id])
        render :new
      end
    end
  
    def show
     @instrument = Instrument.find_by(id: params[:id])
    end
  
    def edit
      if @instrument.user_id != current_user.id
        redirect_to instruments_path
      else
        @family = Family.find_by(id: @instrument.family_id)
      end
    end
  
    def update
      @instrument.update(instrument_params)
      redirect_to instrument_path(@instrument)
    end
  
    def destroy
     
      if @instrument.user_id != current_user.id
        redirect_to instruments_path
      else
        @instrument.destroy
        redirect_to instruments_path
      end
    end
  
    private
  
    def set_instrument
      @instrument = Instrument.find_by(id: params[:id])
    end
  
    def instrument_params
      params.require(:instrument).permit(
        :price, 
        :year, 
        :frets, 
        :color, 
        :material, 
        :hole, 
        :body, 
        :neck, 
        :back, 
        :bridge, 
        :description,  
        :for_sale,
        :category_id,
        :family_id,
        :maker_name,
      )
    end
  end
  
