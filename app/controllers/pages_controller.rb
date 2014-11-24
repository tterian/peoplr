class PagesController < ApplicationController
  def welcome
  end

  def search
  	@query = params[:q]
  end

  def about
  end

  def spread
  end
end
