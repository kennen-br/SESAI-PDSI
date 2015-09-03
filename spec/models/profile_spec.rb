require 'rails_helper'

RSpec.describe Profile, type: :model do
  context 'relations' do
    it { should belong_to :user }
  end

  context 'validations' do
    it { should validate_presence_of :name }
    it { validate_length_of(:name).is_at_most 255 }
  end
end
