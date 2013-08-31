class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
    	t.string :name
    	t.string :permalink
    	t.integer :position
    	t.boolean :visible
      t.references :subject, index: true

      t.timestamps
    end
  end
end
