class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.integer :status, default: 0
      t.integer :priority, default: 1

      t.timestamps
    end
  end
end
