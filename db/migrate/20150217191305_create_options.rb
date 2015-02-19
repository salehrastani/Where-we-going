class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.belongs_to :event
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
