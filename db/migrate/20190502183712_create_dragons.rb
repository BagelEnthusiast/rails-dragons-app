class CreateDragons < ActiveRecord::Migration[5.0]
  def change
    create_table :dragons do |t|
      t.string :name
      t.integer :age
      t.belongs_to :user

      t.timestamps
    end
  end
end
