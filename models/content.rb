class Content
    include DataMapper::Resource

    property :id, Serial
    property :name, String

    belongs_to :list

end
