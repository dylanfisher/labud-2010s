class CreateAudioBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :audio_blocks do |t|
      t.references :media_item, null: false, foreign_key: true
      t.timestamps
    end

    reversible do |change|
      change.up do
        unless BlockKind.find_by_name('AudioBlock')
          BlockKind.create name: 'AudioBlock',
                           record_type: 'default',
                           category: 'Media',
                           description: 'Upload an audio file. What did the 2010s sound like?'
        end
      end

      change.down do
        BlockKind.where(name: 'AudioBlock').destroy_all
      end
    end
  end
end
