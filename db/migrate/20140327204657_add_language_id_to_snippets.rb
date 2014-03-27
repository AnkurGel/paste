class AddLanguageIdToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :language_id, :integer
  end
end
