class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.date :limit_date
      t.integer :status

      t.timestamps
    end
  end
end
