class AddMasterRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :room, index: true
  end
end
