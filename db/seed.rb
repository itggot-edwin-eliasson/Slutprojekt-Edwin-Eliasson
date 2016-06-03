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
      Content.create(name: 'Apples', list_id: 1)
      Content.create(name: 'Carrots', list_id: 1)
      Content.create(name: 'Oranges', list_id: 1)
      Content.create(name: 'Tour Eiffel', list_id: 2)
      Content.create(name: 'Triumphal Arch', list_id: 2)
  end

  def self.user_group
      Usergrouping.create(user_id: 1, group_id: 1)
      Usergrouping.create(user_id: 1, group_id: 2)
  end

  def self.group
      Group.create(name: 'Shopping')
      Group.create(name: 'Trip')
  end

  def self.list
      List.create(name: 'Groceries', group_id: 1)
      List.create(name: 'Attraction', group_id: 2)
  end

  def self.user_list
      Userlisting.create(user_id: 1 , list_id: 1)
      Userlisting.create(user_id: 1 , list_id: 2)
  end

  def self.user
      User.create(uuid: SecureRandom.uuid, f_name: 'Edwin', l_name: 'Eliasson', email: 'hej@gmail.com', password: 'hello')
  end

end
