class CreatePictures < ActiveRecord::Migration[8.0]
  def change
    create_table :pictures do |t|
      t.string :title
      t.text :description
      t.string :cf_r2_id
      t.string :cf_image_id

      t.timestamps
    end
  end
end
