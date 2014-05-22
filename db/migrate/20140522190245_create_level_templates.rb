class CreateLevelTemplates < ActiveRecord::Migration
  def change
    create_table :level_templates do |t|
      t.integer :begin_level, :null => false, default: 1
      t.integer :end_level, :null => false
      t.integer :overpower_level
      t.integer :begin_exp, :null => false, default: 0
      t.integer :end_exp
      t.integer :overpower_exp
      t.string :levelup_factor_formula, :null => false

      t.timestamps
    end
  end
end
