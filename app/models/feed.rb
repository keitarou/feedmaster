class Feed < ActiveRecord::Base
  attr_accessible :description, :feedurl, :link, :title
  has_many :entries
end
