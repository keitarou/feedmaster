class FeedsController < InheritedResources::Base

  def new
    if params[:feedurl]
      #post
      require 'open-uri'
      requesturl =
        "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=#{params[:feedurl]}&num=1"
        json = JSON.parser.new(open(requesturl).read).parse
        feed = Feed.new
        feed.feedurl = json["responseData"]["feed"]["feedUrl"]
        feed.title = json["responseData"]["feed"]["title"]
        feed.link = json["responseData"]["feed"]["link"]
        feed.description = json["responseData"]["feed"]["description"]
        begin
          feed.save
          p "save #{feed.title}"
        rescue => ex
          p "already saved #{feed.title}"
          render :text => ex
        end
    else
     
    end
  end

end
