# frozen_string_literal: true

class AddFkeyToPages < ActiveRecord::Migration[7.0]
  def up
    remove_column :pages, :link_id

    change_table :pages do |t|
      t.references :link, index: true, null: false
    end

    add_foreign_key :pages, :links, on_delete: :cascade
  end

  def down
    remove_column :pages, :link_id

    change_table :pages do |t|
      t.references :link, index: true, null: false
    end
  end
end
