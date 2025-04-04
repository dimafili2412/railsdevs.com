class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.references :business, null: false, foreign_key: true
      t.references :developer, null: false, foreign_key: true

      t.timestamps
    end
    add_index :favorites, [:business_id, :developer_id], unique: true
  end
end
