class EquipmentController < ApplicationController

  def new
    @equipment = Equipment.new
    @items = Equipment.all.order(:name)
  end

  def create
    @equipment = Equipment.new(equipment_params)
 
    if @equipment.save
      redirect_to edit_path(@equipment), notice: "Equipment updated"
    else
      redirect_to new_equipment_path, alert: "Creating equipment failed"
    end
  end

  def edit
    @equipment = Equipment.find(params[:id])
    @items = Equipment.all.order(:name)
  end

  def update
    @equipment = Equipment.find(params[:id])
   
    if @equipment.update(equipment_params)
      redirect_to edit_equipment_path(@equipment), notice: "Equipment updated"
    else
      redirect_to edit_equipment_path(@equipment), alert: "Equipment update failed"
    end
  end

  def index
    @items = Equipment.all.order(:name)
  end

  def autocomplete_equipment
    equipment = Equipment.where('equipment.name LIKE ?', "%#{params[:term]}%")
    render :json => equipment.map { |e| {:id => e.id, :label => e.name, :value => e.id} }
  end

  private
    def equipment_params
      equipment_params = params.require(:equipment).permit(
          :name,
          :usable,
          :charges,
          :cost,
          :uses_per_game,
          :description,
          :reminder,
          :database,
      )
      equipment_params
    end
end
