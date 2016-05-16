class Grouptagging
    include DataMapper::Resource

    belongs_to :group, :key => true
    belongs_to :tag, key => true


end
