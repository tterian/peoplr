class PagesController < ApplicationController
	def welcome
	end

	def search
		@query = params[:q]

		# Not a good practice to share these keys though...
		client = Twitter::REST::Client.new do |config|
			config.consumer_key        = "q8q9SyMjx5t0YhGCPbnKPFI6K"
			config.consumer_secret     = "0OnRgiJFaOVbYTxoF3RNCe5coMxYMTAyWW9btAlJfyKexC9Egz"
			config.access_token        = "2909787830-toEPbGdfL10pdm1FMKdCyeBFuDZ6AWIp7W0Zchl"
			config.access_token_secret = "sRkRHDvVd5WhT6lH8cNadCHJN3Pb7AanJ1rEqgbsP0mAi"
		end

		@result = client.user_search("#{@query}", count: 10)
		#first_user_id = @result[0].id
		first_user = @result[0].screen_name

		# Get photos from Twitter
		extended_query = ["#{@query}", "#{@query.delete(" ")}", "#{first_user}"]
		image_urls = Array.new

		extended_query.each do |q|
			tweets = client.search("#{q}", count: 30, result_type: "mixed", include_entities: true, filter: "images")

			@statuses = tweets.attrs[:statuses]
			@statuses.each do |status|
				if status[:entities].size == 5
						image_url = status[:entities][:media][0][:media_url]
						type = status[:entities][:media][0][:type]
						source = status[:source]
						text = status[:text]
				end
				image_urls += ["#{image_url}"]
			end

		end

		@images = image_urls.uniq


		# Get description from Wikipedia

#    user = first_user.sub(" ", "%20")
#    request_options = "&prop=revisions&rvprop=content&format=json&"
#    address = "http://en.wikipedia.org/w/api.php?action=query#{request_options}titles=#{user}&rvsection=0"

#    url = URI(address)    
#    http = Net::HTTP.new url.host, url.port
#    request = Net::HTTP::Get.new url.request_uri

#    http.start
#    response = http.request(request)

#    infobox = response.body.split("Infobox character")[1]
#    infobox_header = infobox.split("\\n\\n")[0]
#    infobox_bio = infobox.split("\\n\\n")[1]


#    first_user = @result[0].name

#    @result.each do |user|
#      @id = user.id
#      @pic = user.profile_image_url
#      @name = user.name
#      @screen_name = user.screen_name
#      @location = user.location
#      @followers = user.followers_count
#      @description = user.description
#      @verified = user.verified
#    end

#    page = Wikipedia.find("#{first_user}")
#    content = page.raw_data
#    content.fetch("query")

#    fetch("pages") fetch("2275990") .flatten


#    start_point = spit.index("#{content}")

#    while 

	end


end
