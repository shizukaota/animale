class SearchsController < ApplicationController
　　　#送られてきたflgがtagだった場合、tagged_withでタグ検索を行います
　　　#tagでない場合はキーワード検索を行います
  def index
  	if params[:flg] == "tag"
	    @searchresult = Store.tagged_with(params[:pm]).page(params[:page]).reverse_order
    else
 	    @search = Store.ransack(params[:q])
      @searchresult = @search.result.page(params[:page]).reverse_order
    end
  end

  #formから送られてきた[:q][:storename_contにワードというflgをつけます(indexに行きます)
  def wordsearch
  	redirect_to searchresult_path(flg: "word", pm: params[:q][:storename_cont])
  end
　#formから送られてきたparams[:q]にtagというflgをつけます(indexに行きます)
  def tagsearch
  	redirect_to searchresult_path(flg: "tag", pm: params[:q])
  end


  private

  def search_params
	  params.require(:result).permit(:q)
  end
end