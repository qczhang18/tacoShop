class AddPepperToTaco < ActiveRecord::Migration[5.1]
  def change
    add_column :tacos, :pepper, :boolean
  end
end
