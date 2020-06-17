class WarbandsController < ApplicationController
  def index
    warband = Warband.first
    render json: warband
  end

  def create
    wbp = warband_params
    puts "warband_params: #{wbp}"
    w = Warband.new(wbp)
    w.save!
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
      i: stats_permitted_params,
      m: stats_permitted_params,
      t: stats_permitted_params,
      s: stats_permitted_params,
      w: stats_permitted_params,
      a: stats_permitted_params,
      ws: stats_permitted_params,
      ld: stats_permitted_params,
      bs: stats_permitted_params,
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
      :racial_max,
      :value,
      :is_leveled,
      :is_dirty
    ]
  end
end
