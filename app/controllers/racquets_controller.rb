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

  get "/racquets/:id/edit" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @racquet = Racquet.find(params[:id])
    erb :'racquets/edit'
  end

  post "/racquets/:id" do
   redirect_if_not_logged_in
   @racquet = Racquet.find(params[:id])
   unless Racquet.valid_params?(params)
     redirect "/racquets/#{@racquet.id}/edit?error=invalid racquet club"
   end
   @racquet.update(params.select{|k|k=="name" || k=="manufacturer" || k=="tennis_bag_id"})
   redirect "/racquets/#{@racquet.id}"
 end

 get "/racquets/:id" do
    redirect_if_not_logged_in
    @racquet = Racquet.find(params[:id])
    erb :'racquets/show'
  end

  post "/racquets" do
    redirect_if_not_logged_in
    unless Racquet.valid_params?(params)
      redirect "/racquets/new?error=invalid racquet"
    end
    Racquet.create(params)
    redirect "/racquets"
  end
end
