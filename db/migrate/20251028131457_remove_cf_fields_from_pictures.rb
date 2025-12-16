class RemoveCfFieldsFromPictures < ActiveRecord::Migration[8.0]
  def change
    remove_column :pictures, :cf_rd_id, :string
    remove_column :pictures, :cf_image_id, :string
  end
end
