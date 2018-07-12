class RacquetsController < ApplicationController

  get "/racquets" do
      redirect_if_not_logged_in
      @racquets = Racquet.all
      erb :'racquets/index'
    end

    get "/racquets/new" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'racquets/new'
  end

end
