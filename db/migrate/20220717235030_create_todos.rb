class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :name
      t.integer :status, default: 0, null: false
      t.integer :priority, default: 0, null: false

      t.timestamps
    end
  end
end
