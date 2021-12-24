class Preloader::RelationshipEntries
  def self.preload(entries)
    preloader = ActiveRecord::Associations::Preloader.new
    preloader.preload(entries.select { |entry| entry.type == 'ParentEntry' }, [:child_entries])
  end
end
