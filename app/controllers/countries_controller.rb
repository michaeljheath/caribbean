class CountriesController < ApplicationController
  def autocomplete
    countriesHash = []
    countries = Country.where('name LIKE ?', "%#{params[:query]}%").pluck(:name, :id)
    countries.each do |c|
      countriesHash << {
          :value => c[0],
          :data => c[1].to_s(),
      }
    end
    render json: countriesHash
  end
end
