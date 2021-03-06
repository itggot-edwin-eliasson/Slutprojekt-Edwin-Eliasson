class App < Sinatra::Base
  enable :sessions

  get '/' do
    erb :frontpage
  end

  get '/lists' do
      @lists = List.all
      erb :lists
  end

  post '/register' do
      email = params['reg_email']
      f_name = params['f_name']
      l_name = params['l_name']
      password = params['reg_password']
      uuid = SecureRandom.uuid
      user = User.create(f_name: f_name, l_name: l_name, email: email, password: password, uuid: uuid)
      if user.valid?
          session[:id] = user.id
          redirect "/user/#{uuid}"
      else
          redirect back
      end
  end

  post '/login' do
      email = params['email']
      password = params['password']
      user = User.first(email: email)
      if user && user.password == password
          session[:id] = user.id
          redirect "/user/#{user.uuid}"
      else
          redirect '/'
      end
  end

  get '/user/:uuid' do |uuid|
      user = User.first(uuid: uuid)
      @groups = user.groups
      @lists = user.lists
      @user = user

      erb :logged_in
  end

  post '/new_list' do
      user = User.first(id: session[:id])
      name = params['list-name']
      group_name = params['group']
      share_email = params['share-user']
      if Group.first(name: group_name)
          group = Group.first(name: group_name)
      else
          group = Group.create(name: group_name, user_id: session[:id])
      end
      list = List.create(name: name, group_id: group.id)
      Userlisting.create(user_id: session[:id], list_id: list.id)
      if User.first(email: share_email)
          s_user = User.first(email: share_email)
          Userlisting.create(user_id: s_user.id, list_id: list.id)
      end
      redirect "/user/#{user.uuid}"
  end

  post '/new_group' do
      user = User.get(session[:id])
      name = params['group-name']
      Group.create(name: name, user_id: session[:id])
      redirect "/user/#{user.uuid}"
  end

  get '/user/:uuid/:list/content' do |uuid, list|
      user = User.first(uuid: uuid)
      @list = List.first(name: list)
      @groups = user.groups
      @lists = user.lists
      @content = @list.contents
      @user = user

      erb :content
  end

  post '/new_content' do
      user = User.get(session[:id])
      name = params['content-name']
      list_id = params['list-id']
      list = List.first(id: list_id)
      Content.create(name: name, list_id: list_id)

      redirect "/user/#{user.uuid}/#{list.name}/content"
  end

  post '/user/share_user' do
      user = User.get(session[:id])
      s_user = User.first(email: params['user-email'])
      list_id = params['list_id']
      list = List.get(list_id)
      if s_user
          Userlisting.create(user_id: s_user.id, list_id: list.id)
      end
      redirect "/user/#{user.uuid}/#{list.name}/content"
  end

  post '/check_off' do
      user = User.get(session[:id])
      content_id = params['content-id']
      list_id = params['list-id']
      content = Content.get(content_id)
      list = List.get(list_id)
      content.update(check: true)

      redirect "/user/#{user.uuid}/#{list.name}/content"
  end

  post '/check_on' do
      user = User.get(session[:id])
      content_id = params['content-id']
      list_id = params['list-id']
      content = Content.get(content_id)
      list = List.get(list_id)
      content.update(check: false)

      redirect "/user/#{user.uuid}/#{list.name}/content"
  end

  post '/delete/:list' do
      user = User.get(session[:id])
      list_id = params['list-name']
      list = List.get(list_id)
      content = Content.all(list: list)
      content.destroy
      list.destroy!

      redirect "/user/#{user.uuid}"
  end

  post '/user/delete/groups' do
      user = User.get(session[:id])
      group_id = params['group']
      group = Group.get(group_id)
      if List.all(group: group)
          list = List.all(group: group)
          p list
          list.destroy!
      end
      group.destroy!

      redirect "/user/#{user.uuid}"
  end

  get '/logout' do
      session.destroy

      redirect '/?'
  end
end
