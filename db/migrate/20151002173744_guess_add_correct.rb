class GuessAddCorrect < ActiveRecord::Migration
  def change
    add_column :guesses, :is_correct, :boolean, default: false
  end
end
