class CreateEmbedBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :embed_blocks do |t|
      t.text :embed_code
      t.boolean :full_bleed, default: false, null: false
      t.timestamps
    end

    reversible do |change|
      change.up do
        unless BlockKind.find_by_name('EmbedBlock')
          BlockKind.create name: 'EmbedBlock',
                           record_type: 'default',
                           category: 'Media',
                           description: 'Embed arbitrary code such as a YouTube of Vimeo iFrame'
        end
      end

      change.down do
        BlockKind.where(name: 'EmbedBlock').destroy_all
      end
    end
  end
end
