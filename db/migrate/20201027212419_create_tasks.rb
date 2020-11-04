class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :position
      t.boolean :done, default: false
      t.timestamp :due_date
      t.belongs_to :project, foreign_key: { to_table: :projects }

      t.timestamps
    end
  end
end
