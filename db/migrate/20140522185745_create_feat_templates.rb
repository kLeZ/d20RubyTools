class CreateFeatTemplates < ActiveRecord::Migration
  def change
    create_table :feat_templates do |t|
      t.string :name, :null => false
      t.text :description, :null => false
      t.string :formula, :null => false

      t.timestamps
    end
  end
end
