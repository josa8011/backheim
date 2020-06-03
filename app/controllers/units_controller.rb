class UnitsController < ApplicationController
  autocomplete :warband, :warband_type, full: true
  autocomplete :race, :name, full: true

  def new
    @unit = Unit.new
    @items = Unit.all
  end

  def create
    @unit = Unit.new(unit_params)
    @unit.database_id = session[:database_id]

    if @unit.save
      UnitSkillList.unscoped.for_unit(@unit).update_all(database_id: session[:database_id])
      redirect_to edit_unit_path(@unit), notice: "Unit created"
    else
      redirect_to new_unit_path, alert: "Creating unit failed"
    end
  end

  def edit
    @unit = Unit.find(params[:id])
    @items = Unit.all
  end

  def update
    @unit = Unit.find(params[:id])

    if @unit.database_id == session[:database_id]
      if @unit.update(unit_params)
        redirect_to edit_unit_path(@unit), notice: "Unit updated"
      else
        redirect_to edit_unit_path(@unit), alert: "Unit update failed"
      end
    else
      @unit = Unit.new(unit_params)
      @unit.database_id = session[:database_id]

      if @unit.save
        UnitSkillList.unscoped.for_unit(@unit).update_all(database_id: session[:database_id])
        redirect_to edit_unit_path(@unit), notice: "Unit updated"
      else
        redirect_to edit_unit_path(@unit), alert: "Unit update failed"
      end
    end
  end

  def index
    @items = Unit.all
  end
  
  private
    def unit_params
      unit_params = params.require(:unit).permit(
          :unit_type,
          :name,
          :suggestion,
          :m,
          :ws,
          :bs,
          :s,
          :t,
          :w,
          :i,
          :a,
          :ld,
          :exp,
          :cost,
          :rating,
          :race_id,
          :warband_id,
          :database,
          skill_list_ids: [],
          special_rules_attributes: [:id, :name, :description, :reminder, :cost, :usable, :uses_per_game, :_destroy],
          special_skills_attributes: [:id, :name, :description, :reminder, :cost, :usable, :uses_per_game, :_destroy],
          starting_equipment_ids: []
      )

      unit_params[:skill_list_ids] = unit_params[:skill_list_ids].reject(&:empty?)

      unit_params
    end
end
