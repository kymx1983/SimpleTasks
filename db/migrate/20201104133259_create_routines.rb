class CreateRoutines < ActiveRecord::Migration[6.0]
  def change
    create_table :routines do |t|
      t.integer :user_id
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
