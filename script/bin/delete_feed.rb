
p "delete feed id:"
feed_id = gets()

feed = Feed.find(feed_id)

feed.entries.each do |entry|
  entry.accesses.each do |access|
    access.destroy
  end
  p "delete entry_id #{entry.id}"
  entry.destroy
end

p "delete feed title #{feed.title}"
feed.destroy
