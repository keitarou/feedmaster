#encoding: utf-8
require 'open-uri'

feeds = Feed.all
feeds.each do |feed|
  p feed.title
  requesturl = "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=#{feed.feedurl}&num=10"
  json = JSON.parser.new(open(requesturl).read).parse

  json["responseData"]["feed"]["entries"].each do |ent|
    entry = Entry.new(
      :feed_id => feed.id,
      :title => ent["title"],
      :link => ent["link"],
      :author => ent["author"],
      :content => ent["content"],
      :published_at => Entry.published_at_format(ent["publishedDate"])
    )

    begin
      if !Entry.find_by_link(entry.link)
        entry.save
        p "save #{entry.title}"
      else
        raise
      end
    rescue
      p "already saved #{entry.title}"
      break 2
    end
  end

  sleep 1
end
