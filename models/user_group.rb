class Usergrouping
    include DataMapper::Resource

    belongs_to :user, :key => true
    belongs_to :group, :key => true

end
