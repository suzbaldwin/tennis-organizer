class TennisBagsController < ApplicationController

  get "/tennis_bags" do
    redirect_if_not_logged_in
    @tennis_bags = TennisBag.all
    erb :'tennis_bags/index'
  end




end
