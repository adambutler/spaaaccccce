class AliasesController < ApplicationController
  def new
    @alias = Alias.new
  end

  def create
    @alias = Alias.where(original_url: params["alias"]["original_url"]).first_or_create
    respond_to do |format|
      format.js
    end
  end

  private

  def alias_params
    params.require(:alias).permit(:original_url)
  end
end
