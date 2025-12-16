class AddVisibleToPictures < ActiveRecord::Migration[8.0]
  def change
    add_column :pictures, :visible, :boolean, default: true, null: false
  end
end
