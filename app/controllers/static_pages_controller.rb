class StaticPagesController < ApplicationController
  def index
    # @videos = call_api()
    render :index
  end
  
  def create
    search_term = params[:term]
    puts search_term
    @videos = call_api(search_term)
    render :show
  end
end
