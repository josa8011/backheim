class WarbandsController < ApplicationController
  def index
    render(json: Warband.all, include: { 
        heroes: unit_json_include,
        henchmen: unit_json_include,
        hired_swords: unit_json_include,
        dramatis_personaes: unit_json_include,
        equipment: {except: default_exclude}
      }
    )
  end

  def create
    w = Warband.new(warband_params)
    w.save!
    render json: w
  end

  private
  def warband_params
    warband_params = params.require(:warband).permit(
      :name, 
      :type,
      :games_played,
      :created_at,
      :shards,
      :gold_crowns,
      :mode,
      heroes: unit_permitted_params,
      henchmen: unit_permitted_params,
      hired_swords: unit_permitted_params,
      dramatis_personaes: unit_permitted_params,
      equipment: item_permitted_params
    )

    warband_params[:heroes_attributes] = Hero.paramify_json(warband_params.delete :heroes)
    warband_params[:henchmen_attributes] = Henchman.paramify_json(warband_params.delete :henchmen)
    warband_params[:hired_swords_attributes] = HiredSword.paramify_json(warband_params.delete :hired_swords)
    warband_params[:dramatis_personaes_attributes] = DramatisPersonae.paramify_json(warband_params.delete :dramatis_personaes)
    warband_params[:equipment_attributes] = Equipment.paramify_json(warband_params.delete :equipment)

    warband_params
  end

  def unit_permitted_params
    [
      :name,
      :is_large,
      :exp,
      :starting_exp,
      :cost,
      :type,
      :full_type,
      :gained_levels,
      :rating,
      :wounds_left,
      :ooa,
      :num_units,
      :num_ooa,
      :warband_type,
      skill_categories: [],
      stats: stats_permitted_params,
      skills: item_permitted_params,
      dropped_equipment: item_permitted_params,
      equipment: item_permitted_params
    ]
  end

  def item_permitted_params
    [
      :charges,
      :cost,
      :droppable,
      :expires,
      :name,
      :reminder,
      :special_cost,
      :usable,
      :uses_per_game,
      :range
    ]
  end

  def stats_permitted_params
    [
      :name,
      :racial_max,
      :value,
      :is_leveled,
      :is_dirty
    ]
  end

  def unit_json_include
    {
      include: {
        stats: {except: default_exclude},
        skills: {except: default_exclude},
        equipment: {except: default_exclude},
        dropped_equipment: {except: default_exclude}
      }
    }
  end

  def default_exclude
    [:created_at, :updated_at, :unit_id, :warband_id]
  end
end
