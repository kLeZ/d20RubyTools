class CreateRpgTemplates < ActiveRecord::Migration
  def change
    create_table :rpg_templates do |t|
      t.string :name, :null => false
      t.string :default_dice, :null => false
      t.boolean :has_classes, :null => false
      t.boolean :has_levels, :null => false
      t.boolean :has_feats, :null => false
      t.boolean :has_skills, :null => false
      t.boolean :has_passive_defense, :null => false
      t.references :feat_template, index: true
      t.references :skill_template, index: true
      t.references :stat_template, index: true
      t.references :level_template, index: true
      t.references :health_points_template, index: true

      t.timestamps
    end
  end
end
