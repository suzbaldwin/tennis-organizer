class RacquetsController < ApplicationController

  get "/racquets" do
      redirect_if_not_logged_in
      @racquets = Racquet.all
      erb :'racquets/index'
    end

end
