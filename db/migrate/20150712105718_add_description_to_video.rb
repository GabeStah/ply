class AddDescriptionToVideo < ActiveRecord::Migration
  def change
    add_reference :videos, :description, index: true, foreign_key: true
  end
end
