class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :logs, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
