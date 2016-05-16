class Tag
    include DataMapper::Resource

    property :id, Serial
    property :name, String

    has n, :grouptaggings
    has n, :groups, :through => :grouptaggings

    has n, :listtaggings
    has n, :lists, :through => :listtaggings
end
