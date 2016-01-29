class AddHeadquartersToDemographicDatas < ActiveRecord::Migration
  def change
    add_column :demographic_datas, :headquarters, :integer
  end
end
