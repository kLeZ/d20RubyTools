class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.references :room, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
