class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :qq, index: true
      t.text :content
      t.string :creator

      t.timestamps
    end
  end
end
