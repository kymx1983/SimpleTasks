class ChangeColumnTime < ActiveRecord::Migration[6.0]
  def change
    change_column :tasks, :limit_time, :string
    change_column :routines, :limit_time, :string
  end
end
