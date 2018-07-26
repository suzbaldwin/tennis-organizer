class UsersController < ApplicationController

  get '/signup' do
    # if !session[:user_id]
      erb :'users/new'
    # else
    #   redirect to '/racquets'
    # end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.create(:username => params[:username], :password => params[:password])

      session[:user_id] = @user.id
      redirect '/tennis_bags'
    end
  end

  get '/login' do

    if !session[:user_id]
      erb :'users/login'
    else
      redirect '/tennis_bags/new'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/tennis_bags/new"
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end


end
