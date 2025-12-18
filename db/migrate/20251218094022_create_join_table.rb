class CreateJoinTable < ActiveRecord::Migration[8.0]
  def change
    create_table :pictures_tags, id: false do |t|
      t.bigint :picture_id
      t.string :tag_id
      t.index [ :picture_id, :tag_id ], unique: true
      t.index [ :tag_id, :picture_id ]
    end
  end
end
