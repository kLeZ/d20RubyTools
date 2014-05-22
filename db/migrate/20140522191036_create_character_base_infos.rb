class CreateCharacterBaseInfos < ActiveRecord::Migration
  def change
    create_table :character_base_infos do |t|
      t.string :name, :null => false
      t.integer :age
      t.text :description, :null => false
      t.float :height
      t.float :weight
      t.string :eyes
      t.string :skin
      t.string :gender
      t.string :hair

      t.timestamps
    end
  end
end
