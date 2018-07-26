class RacquetsController < ApplicationController

  get "/racquets" do
    if logged_in?
      @user = current_user
      @racquets = Racquet.all
      erb :'racquets/index'
    end
  end
  get "/racquets/new" do
    if logged_in?
      erb :'racquets/new'
    end
  end
  get "/racquets/:id/edit" do
    if logged_in?

    @racquet = Racquet.find(params[:id])
    erb :'racquets/edit'
  end
end
  patch "/racquets/:id" do

    @racquet = Racquet.find_by_id(params[:id])

      if !params[:content].empty? || !params[:manufacturer].empty?
        @racquet.update(:name => params[:name]) || @racquet.update(:manufacturer => params[:manufacturer])
        @racquet.save
        redirect "racquets/#{params[:id]}"
      else
        redirect "racquets/#{params[:id]}/edit"
      end
    end


  get "/racquets/:id" do
    if logged_in?
      @racquet = Racquet.find(params[:id])
      erb :'racquets/show'

    else
      redirect to '/login'
    end
  end

  post "/racquets" do
    if !params[:name].empty? || !params[:manufacturer].empty?
      @racquet = Racquet.create(name: params[:name], manufacturer: params[:manufacturer])
      redirect '/racquets'
    else
      redirect to '/racquets/new'
    end
  end
end
