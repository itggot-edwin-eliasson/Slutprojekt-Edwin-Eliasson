class List
    include DataMapper::Resource

    property :id, Serial
    property :name, String, required: true

    has n, :contents
    belongs_to :group

    has n, :userlistings
    has n, :users, :through => :userlistings

    has n, :listtaggings
    has n, :tags, :through => :listtaggings

end
