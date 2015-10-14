class PdsiResultValueValidator < ActiveModel::Validator
  def validate(record)
    (2016..2019).map do |year|
      unless record.send("value_#{year}") >= record.result.send("value_#{year}")
        record.errors["value_#{year}".to_sym] << "Valor de #{year} deve ser maior a referência"
      end
    end
  end
end