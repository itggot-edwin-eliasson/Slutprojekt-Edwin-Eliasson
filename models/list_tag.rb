class Listtagging
    include DataMapper::Resource

    belongs_to :list, :key => true
    belongs_to :tag, :key => true

end
