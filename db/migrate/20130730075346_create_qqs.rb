class CreateQqs < ActiveRecord::Migration
  def change
    create_table :qqs do |t|
      t.string :number
      t.references :list, index: true
      t.string :status

      t.timestamps
    end
  end
end
