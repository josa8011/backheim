class Api::DbController < ApplicationController
  def index
    respond_to do |format|
      format.json { render :json => {test: "test"}.to_json }
    end
  end
end