class CreateSkillTemplates < ActiveRecord::Migration
  def change
    create_table :skill_templates do |t|
      t.string :name, :null => false
      t.integer :min_value, :null => false
      t.integer :max_value
      t.string :applied_stat

      t.timestamps
    end
  end
end
