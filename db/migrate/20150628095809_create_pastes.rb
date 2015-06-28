class CreatePastes < ActiveRecord::Migration
  def change
    create_table :pastes do |t|
      t.string :name, null: false
      t.text :contents, null: false

      t.timestamps null: false
    end
  end
end
