require 'rails_helper'

RSpec.describe ParentEntry, type: :model do

  describe 'associations' do
    it { should have_many(:child_entries).with_foreign_key(:entry_id) }
  end

  describe 'validations' do
    it { should validate_presence_of(:end_date) }
  end
end

