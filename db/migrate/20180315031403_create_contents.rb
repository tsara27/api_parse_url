class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.string :tag
      t.text :content
      t.references :content_url
      t.timestamps
    end
  end
end
