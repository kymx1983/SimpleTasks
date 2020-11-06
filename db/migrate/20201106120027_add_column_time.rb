class AddColumnTime < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :limit_time, :integer
    add_column :routines, :limit_time, :integer
  end
end
