class WarbandsController < ApplicationController
  def new
    @warband = Warband.new
    @items = Warband.all
  end

  def create
    @warband = Warband.new(warband_params)
    @warband.database_id = session[:database_id]

    if @warband.save
      redirect_to edit_warband_path(@warband), notice: "Warband created"
    else
      redirect_to new_warband_path, alert: "Creating warband failed"
    end
  end

  def edit
    @warband = Warband.find(params[:id])
    @items = Warband.all.order(:warband_type)
  end

  def index
    @items = Warband.all.order(:warband_type)
  end

  def update
    @warband = Warband.find(params[:id])
   
    if @warband.update(warband_params)
      redirect_to edit_warband_path(@warband), notice: "Warband updated"
    else
      redirect_to edit_warband_path(@warband), alert: "Warband update failed"
    end
  end

  private
  def warband_params
    warband_params = params.require(:warband).permit(
        :warband_type,
        skills_attributes: [:id, :name, :description, :reminder, :cost, :usable, :uses_per_game, :_destroy],
    )
    warband_params
  end
end
