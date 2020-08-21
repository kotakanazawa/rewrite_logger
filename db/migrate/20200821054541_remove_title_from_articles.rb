# frozen_string_literal: true

class RemoveTitleFromArticles < ActiveRecord::Migration[6.0]
  def up
    remove_column :articles, :title, :string
  end

  def down
    add_column :articles, :title, :string
  end
end
