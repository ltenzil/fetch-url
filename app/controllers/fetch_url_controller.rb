class FetchUrlController < ApplicationController
  def index
  end

  def show
    @flag, @result = ScraperService.fetch_assets(params[:url])
  end
end
