require 'rails_helper'

RSpec.describe UserType, type: :model do
  context 'relations' do
    it { should have_many :users }
  end

  context 'validations' do
    it { should validate_presence_of :name }
    it { validate_length_of(:name).is_at_most 255 }
    it { validate_uniqueness_of :name }
  end
end
