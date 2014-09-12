class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.string :nombres
      t.string :apellidos
      t.string :cedula
      t.date :fecha_nacimiento
      t.string :sexo
      t.integer :usuario_id

      t.timestamps
    end
  end
end
