# frozen_string_literal: true

class AddLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :url, null: false

      t.timestamps
    end

    add_index :links, :url
  end
end
