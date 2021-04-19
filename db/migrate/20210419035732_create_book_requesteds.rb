class CreateBookRequesteds < ActiveRecord::Migration[5.2]
  def change
    create_table :book_requesteds do |t|
      t.string :title
      t.string :author
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
