class AddCreatorIdToPolls < ActiveRecord::Migration[8.0]
  def change
    add_column :polls, :creator_id, :integer
  end
end
