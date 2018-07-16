class RacquetsController < ApplicationController

  get "/racquets" do
    if logged_in?
      @user = current_user
      @racquets = Racquet.all
      erb :'racquets/index'
    end

    get "/racquets/new" do
      if logged_in?
    erb :'racquets/new'
  end

  get "/racquets/:id/edit" do
    redirect_if_not_logged_in

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
   if logged_in?
     @racquet = Racquet.find(params[:id])
     erb :'racquets/show'
   end
 else
   redirect to '/login'
 end
  end

  post "/racquets" do

      redirect "/racquets/new?error=invalid racquet"
    end
    Racquet.create(params)
    redirect "/racquets"
  end
end
if !params[:manufacturer][:name].empty?
  @racquet = Racquet.create(name: params[:name] manufacturer: params[:manufacturer])
end
redirect '/racquets'
else
redirect to '/racquets/new'
end
end
end
