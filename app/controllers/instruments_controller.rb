class InstrumentsController < ApplicationController
  def new
  
    @instrument = Instrument.new
    @family = Family.find_by(id: params[:family_id])
  end
end
