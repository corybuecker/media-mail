# frozen_string_literal: true

# migration
class AddPages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.references :link, null: false
      t.binary :raw
      t.binary :parsed

      t.timestamps
    end
  end
end
