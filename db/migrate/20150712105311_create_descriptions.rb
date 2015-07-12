class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.string :text

      t.timestamps null: false
    end
  end
end
