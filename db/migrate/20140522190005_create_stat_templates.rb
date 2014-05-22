class CreateStatTemplates < ActiveRecord::Migration
  def change
    create_table :stat_templates do |t|
      t.string :name, :null => false
      t.integer :min_value, :null => false
      t.integer :max_value
      t.boolean :has_modifier, :null => false, default: false

      t.timestamps
    end
  end
end
