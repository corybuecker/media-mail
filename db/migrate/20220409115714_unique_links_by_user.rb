# frozen_string_literal: true

class UniqueLinksByUser < ActiveRecord::Migration[7.0]
  def up
    remove_index :links, :url
    add_index :links, %i[user_id url], unique: true
  end

  def down
    remove_index :links, %i[user_id url]
    add_index :links, :url, unique: true
  end
end
