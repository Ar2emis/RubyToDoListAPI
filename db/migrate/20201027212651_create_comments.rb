class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.text :image_data
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
