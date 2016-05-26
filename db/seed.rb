class Seeder

  def self.seed!
      self.content
      self.group
      self.list
      self.user
      self.user_group
      self.user_list
  end

  def self.content
      Content.create(name: 'Apple', list_id: 1)
  end

  def self.user_group
      Usergrouping.create(user_id: 1, group_id: 1)
      Usergrouping.create(user_id: 1, group_id: 2)
  end

  def self.group
      Group.create(name: 'Trip')
      Group.create(name: 'Partay!')
  end

  def self.list
      List.create(name: 'Shopping', group_id: 1)
      List.create(name: 'Attraction', group_id: 1)
  end

  def self.user_list
      Userlisting.create(user_id: 1 , list_id: 1)
      Userlisting.create(user_id: 1 , list_id: 2)
  end

  def self.user
      User.create(uuid: SecureRandom.uuid, f_name: 'Edwin', l_name: 'Eliasson', email: 'hej@gmail.com', password: 'hello')
  end

end
