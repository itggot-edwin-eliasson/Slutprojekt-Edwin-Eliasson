class Content
    include DataMapper::Resource

    property :id, Serial
    property :name, String
    property :check, Boolean, default: false

    belongs_to :list

end
