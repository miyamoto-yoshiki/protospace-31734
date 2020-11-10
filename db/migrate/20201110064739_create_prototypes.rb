class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string :tittle,   null: false
      t.text :catch_copy, null: false
      t.text :concept,    null: false
      t.references :user, foreign_key: true #userを参照するための外部キー
      t.timestamps
    end
  end
end
