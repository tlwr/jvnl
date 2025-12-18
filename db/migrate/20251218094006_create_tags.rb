class CreateTags < ActiveRecord::Migration[8.0]
  def change
    create_table :tags, id: :string do |t|
      t.timestamps
    end
  end
end
