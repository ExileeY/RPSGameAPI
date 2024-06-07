class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :uuid
      t.string :user_choice
      t.string :computer_choice

      t.timestamps
    end
  end
end
