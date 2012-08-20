class DropPregunta < ActiveRecord::Migration
    def change
    drop_table :preguntas
  end
end
