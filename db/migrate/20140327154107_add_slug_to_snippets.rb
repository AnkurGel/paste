class AddSlugToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :slug, :string
    add_index :snippets, :slug
  end
end
