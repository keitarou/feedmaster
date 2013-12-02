class Entry < ActiveRecord::Base
  attr_accessible :author, :content, :feed_id, :link, :published_at, :title
  belongs_to :feed
  has_many :accesses

  def self.published_at_format(str)
    months = {
      'Jan' => 1, 'Feb' => 2, 'Mar' => 3, 'Apr' => 4, 
       'May' => 5, 'Jun' => 6, 'Jul' => 7, 'Aug' => 8, 
       'Sep' => 9, 'Oct' => 10, 'Nov' => 11, 'Dec' => 12
    }
    arr = str.split(/ |:/)
    time = Time.local(arr[3], months[arr[2]], arr[1], arr[4], arr[5], arr[6])
    time = time + 17.hour
    time.strftime("%Y/%m/%d %H:%M:%S")
  end

  def published_at_json_format
    self.published_at.strftime('%Y年%m月%d日 %H時%M分')
  end
 
  def feed_title
    self.feed.title
  end

  def as_json(options = {})
    super(
      :only => [
        :id,
        :title,
        :link
      ],
      :methods => [
          :feed_title,
          :published_at_json_format
      ]
    )
  end

end
