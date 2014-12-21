class Item < ActiveRecord::Base
  belongs_to :feed

  def self.add_entries(feed_id, feed_url, category)
    feed = Feedjira::Feed.fetch_and_parse(feed_url)
    add_entry(feed_id, feed.entries, category)
  end
  
  private
  
  def self.add_entry(feed_id, entries, category)
    entries.each do |entry|
      category_name = entry.title.downcase
      if category_name =~ /#{category.downcase}/
        if Item.where(feed_id: feed_id, title: entry.title).blank?
          Item.create(
            :feed_id 		=> feed_id,
            :title 			=> entry.title,
            :description 	=> entry.summary,
            :link 			=> entry.url,
            :published	 	=> entry.published
            )
        end
      end
    end
  end
end