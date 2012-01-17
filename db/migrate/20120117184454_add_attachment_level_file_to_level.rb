class AddAttachmentLevelFileToLevel < ActiveRecord::Migration
 def self.up
    change_table :levels do |t|
      t.has_attached_file :level_file
    end
  end

  def self.down
    drop_attached_file :levels, :level_file
  end
end
