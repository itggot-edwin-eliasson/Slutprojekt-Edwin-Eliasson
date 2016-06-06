class Group
    include DataMapper::Resource

    property :id, Serial
    property :name, String, required: true

    has n, :lists

    belongs_to :user

end
