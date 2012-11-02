class CreateRibbits < ActiveRecord::Migration
  def change
    create_table :ribbits do |t|
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
