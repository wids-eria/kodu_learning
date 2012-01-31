class AddTeacherFlagToUser < ActiveRecord::Migration
  def change
    add_column :users, :teacher, :boolean, :default => false
  end
end
