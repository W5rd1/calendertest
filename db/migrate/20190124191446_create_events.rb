class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.datetime :eventstart
      t.datetime :eventend

      t.timestamps
    end
  end
end
