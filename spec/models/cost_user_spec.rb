require 'rails_helper'

RSpec.describe CostUser, type: :model do

  context 'relations' do
    it { should belong_to(:cost) }
    it { should belong_to(:user) }
  end

  context 'validations' do
    it { should validate_presence_of :cost }
    it { should validate_presence_of :user }
    it { should validate_presence_of :value_2015 }
    it { should validate_numericality_of :value_2015 }
    it { should validate_presence_of :value_2016 }
    it { should validate_numericality_of :value_2016 }
    it { should validate_presence_of :reason }
    it { should validate_presence_of :criteria }
  end
end
