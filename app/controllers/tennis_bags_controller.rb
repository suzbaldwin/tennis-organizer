class TennisBagsController < ApplicationController

  get "/tennis_bags" do
    redirect_if_not_logged_in
    @tennis_bags = TennisBag.all
    erb :'tennis_bags/index'
  end

  get "/tennis_bags/new" do
     redirect_if_not_logged_in
     @error_message = params[:error]
     erb :'tennis_bags/new'
   end

   get "/tennis_bags/:id/edit" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @tennis_bag = TennisBag.find(params[:id])
    erb :'tennis_bags/edit'
  end




end
