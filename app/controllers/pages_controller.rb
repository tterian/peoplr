class PagesController < ApplicationController
  def welcome
  end

  def search
    @query = params[:q]

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "q8q9SyMjx5t0YhGCPbnKPFI6K"
      config.consumer_secret     = "0OnRgiJFaOVbYTxoF3RNCe5coMxYMTAyWW9btAlJfyKexC9Egz"
      config.access_token        = "2909787830-toEPbGdfL10pdm1FMKdCyeBFuDZ6AWIp7W0Zchl"
      config.access_token_secret = "sRkRHDvVd5WhT6lH8cNadCHJN3Pb7AanJ1rEqgbsP0mAi"
    end
  	 
    @result = client.user_search("#{@query}", count: 10)
  end

  def about
  end

  def spread
  end
end
