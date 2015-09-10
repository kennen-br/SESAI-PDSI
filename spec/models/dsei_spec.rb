require 'rails_helper'

RSpec.describe Dsei, type: :model do
  context 'relations' do
    it { should have_many :base_polos }
  end

  context 'validations' do
    it { should validate_presence_of :name }
    it { validate_length_of(:name).is_at_most 255 }

    it { should validate_numericality_of :sesai_id }
    it { validate_uniqueness_of :sesai_id }
  end
end
