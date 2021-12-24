require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe 'associations' do
    it { should have_many(:users) }
    it { should have_many(:entries) }
    it { should have_many(:parent_entries).class_name('ParentEntry') }

  end

  describe 'validations' do

  end
end
