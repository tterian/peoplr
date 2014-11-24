class PagesController < ApplicationController
  def welcome
  end

  def search
    @query = params[:q]

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "TPiF7v0F3cAEC9KpSgrmMEyp7"
      config.consumer_secret     = "VTh9vs3b8QcBbSn0BgddbMKGraUpD4Ky50IM896woDrqi66bNH"
      config.access_token        = "2457919124-gInYE2ljgGB5tYyisA1rwkxRO612Q17wiDFVPcb"
      config.access_token_secret = "twm9pmbseJkY4ZYvdNlEWWSqi48zk7kqwnyF4cKfyVIgk"
    end
  	 
    @result = client.user_search("#{@query}", count: 5)
#    @profile = client.profile("#{@query}")
  end

  def about
  end

  def spread
  end
end
