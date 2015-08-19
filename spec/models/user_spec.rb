require 'rails_helper'

RSpec.describe User, type: :model do

  context 'relations' do
    it { should have_one  :profile }
    it { should have_many :cost_users }
    it { should have_many(:costs).through(:cost_users) }
    it { should have_one  :pdsi }

    it { should belong_to(:user_type) }
  end

  context 'validations' do
    it { should validate_presence_of :username }
    it { should_validate_uniqueness_of :username }
  end

  describe '#email_required?' do
    it { expect(@user.email_required?).to be false }
    it { expect(@user.email_changed?).to be false }
  end
end
