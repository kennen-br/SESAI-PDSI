class PdsiResultValueValidator < ActiveModel::Validator
  def validate(record)
    (2016..2019).map do |year|
      unless record.send("value_#{year}") >= record.result.send("value_#{year}")
        record.errors["value_#{year}".to_sym] << "não pode ser menor que a referência"
      end
    end
  end
end
