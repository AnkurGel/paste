class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :name
      t.string :language
      t.text :raw
      t.text :highlighted

      t.timestamps
    end
  end
end
