class TennisBagsController < ApplicationController

  get "/tennis_bags" do
    if logged_in?
      @user = current_user
      @tennis_bags = TennisBag.all
      erb :'tennis_bags/index'
  else
    redirect '/login'
  end
end

get "/tennis_bags/new" do
  if logged_in?
    @user = current_user
    erb :'tennis_bags/new'
else
  redirect '/login'
end
end

post '/tennis_bags' do
  if !params[:capacity][:name].empty?
    @tennis_bag = TennisBag.create(name: params[:name], capacity: params[:capacity], user: current_user)

  redirect '/tennis_bags'
else
  redirect to '/tennis_bags/new'
end
end

get "/tennis_bags/:id" do
  if logged_in?
    @user = current_user
    @tennis_bag = TennisBag.find(params[:id])
    erb :'tennis_bags/show'

else
  redirect to '/login'
end
end

get "/tennis_bags/:id/edit" do

  @tennis_bag = TennisBag.find(params[:id])
    if logged_in? && @tennis_Bag.user == current_user
      erb :'tennis_bags/edit'
    else
      redirect '/login'
    end
  end

post "/tennis_bags/:id" do
  @tennis_bag = TennisBag.find_by_id(params[:id])

    if !params[:name][:capacity].empty?
      @tennis_bag.update(:name => params[:name], :capacity => params[:capacity])
      @tennis_bag.save
      redirect "tennis_bags/#{params[:id]}"
    else
      redirect "tennis_bags/#{params[:id]}/edit"
    end
  end



end
