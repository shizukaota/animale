class SearchsController < ApplicationController

  def index
  	if params[:flg] == "tag"
	  @searchresult = Store.tagged_with(params[:pm]).page(params[:page]).reverse_order
   else
 	  @search = Store.ransack(params[:q])
    @searchresult = @search.result.page(params[:page]).reverse_order
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