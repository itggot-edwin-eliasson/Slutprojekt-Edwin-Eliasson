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
      full_name = params['full_name']
      password = params['reg_password']
      uuid = SecureRandom.uuid
      user = User.create(full_name: full_name, email: email, password: password, uuid: uuid)
      if user.valid?
          redirect "/#{uuid}"
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
          redirect "/#{user.uuid}"
      else
          redirect '/'
      end
  end

  get '/:uuid' do |uuid|
      user = User.first(uuid: uuid)
      @groups = user.groups
      @lists = user.lists

      erb :logged_in
  end
end
