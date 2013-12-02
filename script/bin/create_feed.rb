#encoding: utf-8
require 'open-uri'


p "feedurl:"
feedurl = gets
requesturl = "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=#{feedurl.chomp}&num=1"

json = JSON.parser.new(open(requesturl).read).parse

feed = Feed.new
feed.feedurl = json["responseData"]["feed"]["feedUrl"]
feed.title = json["responseData"]["feed"]["title"]
feed.link = json["responseData"]["feed"]["link"]
feed.description = json["responseData"]["feed"]["description"]

begin
  feed.save
  p "save #{feed.title}"
rescue
  p "already saved #{feed.title}"
end

