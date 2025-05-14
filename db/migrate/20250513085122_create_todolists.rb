class CreateTodolists < ActiveRecord::Migration[8.0]
  def change
    create_table :todolists do |t|
      t.string :title
      t.string :description
      t.boolean :status
      t.date :deadline_date

      t.timestamps
    end
  end
end
