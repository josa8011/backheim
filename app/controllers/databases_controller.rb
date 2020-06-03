class DatabasesController < ApplicationController


    def new
      @database = Database.new
      @items = Database.all
    end
  
    def create
      @database = Database.new(database_params)
   
      if @database.save
        redirect_to new_database_path(@database), notice: "Database created"
      else
        redirect_to new_database_path, alert: "Creating database failed"
      end
    end

    def edit
    end
  
    def update
    end
  
    def index
      @items = Database.all.order(:name)
    end
  
    def pick
      session[:database_id] = params[:database][:id]
      Database::current_tree = Database.find(params[:database][:id]).db_tree
    end

    private
      def database_params
        database_params = params.require(:database).permit(
          :name,
          :database_id,
        )
        database_params
      end
end