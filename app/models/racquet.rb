class Racquet < ActiveRecord::Base
  belongs_to :tennis_bag

  def self.valid_params?(params)
    return !params[:name].empty? && !params[:manufacturer].empty?
  end

end
