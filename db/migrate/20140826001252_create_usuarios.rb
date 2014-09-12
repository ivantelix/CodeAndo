class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :usuario
      t.string :email
      t.string :password
      t.string :llave
      t.integer :persona_id

      t.timestamps
    end
  end
end
