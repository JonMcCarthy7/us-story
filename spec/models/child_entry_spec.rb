require 'rails_helper'

RSpec.describe ChildEntry, type: :model do

  describe 'associations' do
    it { should belong_to(:parent_entry).with_foreign_key(:entry_id) }
  end

  describe 'validations' do

  end
end


