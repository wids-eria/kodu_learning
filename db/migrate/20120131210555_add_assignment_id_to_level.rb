class AddAssignmentIdToLevel < ActiveRecord::Migration
  def change
    add_column :levels, :assignment_id, :integer
  end
end
