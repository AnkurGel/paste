class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :extension
      t.string :name

      t.timestamps
    end
  end
end
