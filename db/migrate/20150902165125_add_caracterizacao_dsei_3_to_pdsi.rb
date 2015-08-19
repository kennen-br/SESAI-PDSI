class AddCaracterizacaoDsei3ToPdsi < ActiveRecord::Migration
  def change
    add_column  :pdsis, :caracterizacao_do_dsei_3,  :text
  end
end
