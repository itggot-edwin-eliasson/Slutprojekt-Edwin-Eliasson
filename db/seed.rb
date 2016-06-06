class Seeder

  def self.seed!
      self.content
      self.group
      self.list
      self.user
      self.user_list
  end

  def self.content
      Content.create(name: 'Apples', list_id: 1)
      Content.create(name: 'Carrots', list_id: 1)
      Content.create(name: 'Oranges', list_id: 1)
      Content.create(name: 'Tour Eiffel', list_id: 2)
      Content.create(name: 'Triumphal Arch', list_id: 2)
      Content.create(name: 'Seven', list_id: 3)
  end

  def self.group
      Group.create(name: 'Shopping', user_id: 1)
      Group.create(name: 'Trip', user_id: 1)
      Group.create(name: 'Watchlist', user_id: 2)
  end

  def self.list
      List.create(name: 'Groceries', group_id: 1)
      List.create(name: 'Attraction', group_id: 2)
      List.create(name: 'Movies', group_id: 3)
  end

  def self.user_list
      Userlisting.create(user_id: 1 , list_id: 1)
      Userlisting.create(user_id: 1 , list_id: 2)
      Userlisting.create(user_id: 2 , list_id: 1)
      Userlisting.create(user_id: 2, list_id: 3)

  end

  def self.user
      User.create(uuid: SecureRandom.uuid, f_name: 'Edwin', l_name: 'Eliasson', email: 'hej@gmail.com', password: 'hello')
      User.create(uuid: SecureRandom.uuid, f_name: 'Daniel', l_name: 'Berg', email: 'daniel@gmail.com', password: 'test')
  end

end
