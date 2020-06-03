class SkillListsController < ApplicationController
    def autocomplete_magic_lists
        skill_lists = SkillList.where('skill_list_type = "magic" AND name LIKE ?', "%#{params[:term]}%")
        render :json => skill_lists.map { |skill_list| {:id => skill_list.id, :label => skill_list.name, :value => skill_list.name} }
    end
end
  