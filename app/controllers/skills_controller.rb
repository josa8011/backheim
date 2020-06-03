class SkillsController < ApplicationController

  def new
    @skill = Skill.new
    @items = Skill.all.order(:name)
  end

  def create
    @skill = Skill.new(skill_params)
 
    if @skill.save
      redirect_to edit_skill_path(@skill), notice: "Skill created"
    else
      redirect_to new_skill_path, alert: "Creating skill failed"
    end
  end

  def edit
    @items = Skill.all.order(:name)
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])
   
    if @skill.update(skill_params)
      redirect_to edit_skill_path(@skill), notice: "Skill updated"
    else
      redirect_to edit_skill_path(@skill), alert: "Skill update failed"
    end
  end

  def index
    @items = Skill.all.order(:name)
  end

  private
    def skill_params
      skill_params = params.require(:skill).permit(
          :name,
          :usable,
          :cost,
          :uses_per_game,
          :description,
          :reminder,
          :database,
      )
      skill_params
    end
end
