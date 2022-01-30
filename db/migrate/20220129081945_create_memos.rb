class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.string :item, null: false
      t.text :info,   null: false
      t.timestamps
    end
  end
end
