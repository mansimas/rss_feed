require 'uri/http'

class Feed < ActiveRecord::Base
  has_many :items, dependent: :destroy
  
  def self.update_from_feed(feed_url, category)
    add_feed(feed_url, category)
  end
  
  private
  
  def self.add_feed(feed_url, category)
    uri = URI.parse(feed_url)
    title=PublicSuffix.parse(uri.host).domain
    if Feed.where(url: feed_url, category: category).blank?
      create(
        :title     		=> title,
        :category  		=> category,
        :url          	=> feed_url
        )
    end
    feed_id = Feed.where(url: feed_url, category: category).first.id
    Item.add_entries(feed_id, feed_url, category)
  end
end