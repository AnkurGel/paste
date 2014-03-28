class RemoveLanguageFromSnippets < ActiveRecord::Migration
  def change
    remove_column :snippets, :language, :string
  end
end
