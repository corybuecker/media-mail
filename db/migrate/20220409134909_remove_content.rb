# frozen_string_literal: true

class RemoveContent < ActiveRecord::Migration[7.0]
  def up
    drop_table :pages
    execute 'drop type processing_statuses'
  end

  def down
    create_enum :processing_statuses, %w[unprocessed fetched parsed sent]

    create_table :pages do |t|
      t.binary 'raw'
      t.binary 'parsed'
      t.timestamps
      t.string 'title'
      t.enum 'processing_status', default: 'unprocessed', null: false, enum_type: 'processing_statuses'
      t.bigint 'link_id', null: false
      t.index ['link_id'], name: 'index_pages_on_link_id'
    end
  end
end
