class User
    include DataMapper::Resource

    property :id, Serial
    property :uuid, String, required: true
    property :f_name, String, required: true
    property :l_name, String, required: true
    property :email, String, required: true, unique: true, format: :email_address
    property :password, BCryptHash, required: true

    has n, :userlistings
    has n, :lists, :through => :userlistings

    has n, :usergroupings
    has n, :groups, :through => :usergroupings
end
