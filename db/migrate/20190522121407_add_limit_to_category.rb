class AddLimitToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :limit, :integer, default: 0
  end
end
