class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :name
      t.string :address
      t.belongs_to :event

      t.timestamps
    end
  end
end
