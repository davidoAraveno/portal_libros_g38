class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.boolean :reserve, default: false
      t.boolean :payed, default: false

      t.timestamps
    end
  end
end
