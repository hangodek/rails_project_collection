class CreateTodolist < ActiveRecord::Migration[8.0]
  def change
    create_table :todolists do |t|
      t.string :title
      t.string :description
      t.boolean :completed, default: false
      t.date :deadline, null: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
