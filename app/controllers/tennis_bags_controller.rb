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

  post "/tennis_bags/:id" do
     redirect_if_not_logged_in
     @tennis_bag = TennisBag.find(params[:id])
     unless TennisBag.valid_params?(params)
       redirect "/tennis_bags/#{@tennis_bag.id}/edit?error=invalid tennis bag"
     end
     @tennis_bag.update(params.select{|k|k=="name" || k=="capacity"})
     redirect "/tennis_bags/#{@tennis_bag.id}"
   end

   get "/tennis_bags/:id" do
    redirect_if_not_logged_in
    @tennis_bag = TennisBag.find(params[:id])
    erb :'tennis_bags/show'
  end


end
