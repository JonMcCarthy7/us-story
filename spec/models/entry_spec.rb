require 'rails_helper'

RSpec.describe Entry, type: :model do

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:relationship) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:event_type) }

    it { should validate_presence_of(:content) }
    it { should have_rich_text(:content) }

  end
end
