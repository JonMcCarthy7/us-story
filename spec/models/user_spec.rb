require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should belong_to(:relationship).optional }
    it { should have_many(:entries) }
    it { should have_many(:parent_entries).class_name('ParentEntry') }

  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    # it { should validate_presence_of(:date_of_birth) }
  end
end
