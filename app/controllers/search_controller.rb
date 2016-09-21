class SearchController < ApplicationController
  def index
    @stores = Stores.all_by(search_params)
  end

  private
     def search_params
       params.permit(:zipcode)
     end
end
