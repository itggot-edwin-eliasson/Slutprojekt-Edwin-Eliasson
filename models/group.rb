class Group
    include DataMapper::Resource

    property :id, Serial
    property :name, String, required: true

    has n, :lists

    has n, :usergroupings
    has n, :users, :through => :usergroupings

    has n, :grouptaggings
    has n, :tags, :through => :grouptaggings
end
