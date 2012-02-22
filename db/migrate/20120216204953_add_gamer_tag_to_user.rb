class AddGamerTagToUser < ActiveRecord::Migration
  def change
    add_column :users, :gamer_tag, :string
  end
end
