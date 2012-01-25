class AddUserIdToLevels < ActiveRecord::Migration
  def change
    add_column :levels, :user_id, :integer
  end
end
