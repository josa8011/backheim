class WarbandsController < ApplicationController
  def index
    warband = Warband.first
    render json: warband
  end

  def create
  end

  private
  def warband_params
    params.require(:warband).permit(
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
      dramatis_personae: unit_permitted_params,
      equipment: item_permitted_params

    )
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
