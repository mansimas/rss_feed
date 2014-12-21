class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :link
      t.text :description
      t.datetime :published
      t.references :feed, index: true

      t.timestamps
    end
  end
end
