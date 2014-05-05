class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.datetime :time

      t.timestamps
    end
  end
end
