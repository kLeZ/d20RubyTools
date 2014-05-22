class CreateHealthPointsTemplates < ActiveRecord::Migration
  def change
    create_table :health_points_templates do |t|
      t.integer :hp_min_value
      t.integer :hp_max_value

      t.timestamps
    end
  end
end
