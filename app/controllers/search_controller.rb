class SearchController < ApplicationController
  def index
    @number = params[:qq]
    if @number
      @qq = Qq.find_by_number(@number)
    end
  end
end
