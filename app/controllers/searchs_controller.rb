class SearchsController < ApplicationController

  def index
  	p "-------------------"
  	p "flg"
  	p params[:flg]
  	if params[:flg] == "tag"
	  @searchresult = Store.tagged_with(params[:pm])
 	else
  p params[:pm]
 	  @search = Store.ransack(params[:pm])
      @searchresult = @search.result

  end
end

  def wordsearch
  	p "word"
  	redirect_to searchresult_path(flg: "word", pm: params[:q][:storename_cont])

  end

  def tagsearch
  	p "taggggggggg"
  	redirect_to searchresult_path(flg: "tag", pm: params[:q])
  end

  private
  def search_params
	  # binding.pry
	  params.require(:result).permit(:q)
  end

end