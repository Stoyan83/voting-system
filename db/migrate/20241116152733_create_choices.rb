class CreateChoices < ActiveRecord::Migration[8.0]
  def change
    create_table :choices do |t|
      t.string :content
      t.references :choosable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
