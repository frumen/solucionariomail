class CorregirAnsContDef < ActiveRecord::Migration
  def change
  	  	change_column :answers, :content, :text, default: nil
  end
end
