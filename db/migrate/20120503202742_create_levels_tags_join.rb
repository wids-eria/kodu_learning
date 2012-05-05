class CreateLevelsTagsJoin < ActiveRecord::Migration
def self.up
    create_table 'levels_tags', :id => false do |t|
      t.column 'level_id', :integer
      t.column 'tag_id', :integer
    end
  end

  def self.down
    drop_table 'levels_tags'
  end
end
 
