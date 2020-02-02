class CreateQuoteBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :quote_blocks do |t|
      t.text :quote
      t.string :quote_source
      t.timestamps
    end

    reversible do |change|
      change.up do
        unless BlockKind.find_by_name('QuoteBlock')
          BlockKind.create name: 'QuoteBlock',
                           record_type: 'default',
                           category: 'Text',
                           description: 'Pull out quote with quote source'
        end
      end

      change.down do
        BlockKind.where(name: 'QuoteBlock').destroy_all
      end
    end
  end
end
