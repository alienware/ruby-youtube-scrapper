namespace :recommendation_scraper do
  desc "Crawling YouTube by scrapping recommended videos"
	task :scrape, [:url,:num] => :environment do |t, args|
		@a = Mechanize.new

    def crawlRecommdations link, num, video

			video_page = @a.get(link).body
			name = Nokogiri::HTML(video_page).css('span.watch-title').text.split.join(' ')
			video.update_attributes({:name => name})
			ap "Video #{video.name} at #{video.url} to be scraped for recommendations."

			if num.eql? 0
				return
			end

			recommended_link = 'https://www.youtube.com' + Nokogiri::HTML(video_page).css('a.related-video').css('a:not(.related-video-featured)').first.attr('href')
			recommended_video = Video.find_by_url(recommended_link)
			if recommended_video.nil?
				recommended_video = Video.create(:url => recommended_link)
				video.recommendation = crawlRecommdations recommended_link, num-1, recommended_video
			else
				recommended_video
			end
		end

		video = Video.find_by_url(args.url)
		if video.nil?
			video = Video.create(:url => args.url)
			video.recommendation = crawlRecommdations args.url, args.num.to_i, video
			ap "Test case #{video.name} at #{video.url} has been scraped for recommendations."
		else
			ap "Test case already worked upon."
		end
	end

end
