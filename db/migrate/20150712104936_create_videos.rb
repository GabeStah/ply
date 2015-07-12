class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.string :youtube_id
      t.integer :duration
      t.datetime :release_date
      t.boolean :published
      t.string :privacy

      t.timestamps null: false
    end
  end
end
