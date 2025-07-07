class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :note
      t.date :due_date
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
