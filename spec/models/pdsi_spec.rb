require 'rails_helper'

RSpec.describe Pdsi, type: :model do
  context 'relations' do
    it { should belong_to(:user) }
  end
end
