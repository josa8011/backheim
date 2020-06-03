class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :show_no_edit_warning!, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :set_db_tree!, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :no_edit!, only: [:create, :update, :destroy]

  private
    def no_edit!
      # unless user_signed_in?
      #   redirect_back(fallback_location: root_path)
      # end

      # unless session.has_key? :database_id
      #   redirect_back(fallback_location: root_path)
      # end
    end

    def show_no_edit_warning!
      unless user_signed_in?
        flash[:warning] = "You are not #{view_context.link_to 'logged in', new_user_session_path}. Editing is disabled."
      end
    end

    def set_db_tree!
      if Database::current_tree.nil? and session.has_key? :database_id
        Database::current_tree = Database.find(session[:database_id]).db_tree
      elsif Database::current_tree.nil?
        Database::current_tree = Database.where(name: "MRoster Default").first.db_tree
        flash[:warning] = "No database #{view_context.link_to 'selected', new_database_path}, showing default"
      end
    end
end
