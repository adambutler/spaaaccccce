class AliasesController < ApplicationController
  def new
    @alias = Alias.new
  end

  def create
    url = Alias.format_url(params["alias"]["original_url"])
    @alias = Alias.where(original_url: url).first_or_create
    respond_to do |format|
      format.js
    end
  end

  def show
    @alias = Alias.where(lengthened_url: params[:lengthened_url]).first
    if @alias
      redirect_to @alias.original_url
    else
      redirect_to root_path
    end
  end

  private

  def alias_params
    params.require(:alias).permit(:original_url)
  end
end
