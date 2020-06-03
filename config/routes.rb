Rails.application.routes.draw do
  devise_for :users
  get 'start/index'

  get 'units/autocomplete_warband_warband_type'
  get 'units/autocomplete_race_name'
  get 'skill_categories/autocomplete_magic_categories'
  get 'equipment/autocomplete_equipment'

  root 'start#index'
  resources :warbands, :units, :equipment, :skills, :databases
  match 'databases/pick', :to => 'databases#pick', :as => :pick_database, via: [:post]
  
  namespace :api, :defaults => {:format => :json} do
    resources :db, only: [:index]
  end

end
