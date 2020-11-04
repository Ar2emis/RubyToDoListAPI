class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.text :image_data
      t.belongs_to :task, foreign_key: { to_table: :tasks }

      t.timestamps
    end
  end
end
