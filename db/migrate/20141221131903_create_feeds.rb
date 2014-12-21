class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :title, limit: 45
      t.string :url
      t.string :category

      t.timestamps
    end
  end
end
