class AccommodationsController < ApplicationController
  #protect_from_forgery except: :searchByCountry

  #return data for hotel name autocomplete
  def autocomplete
    hotelsHash = []
    hotels = Accommodation.where('name LIKE ?', "%#{params[:query]}%").pluck(:name, :accommodation_id)

    hotels.each do |h|
      hotelsHash << {
          :value => h[0],
          :data => h[1].to_s(),
      }
    end
    render json: hotelsHash
  end

  #load a default set of hotels
  def index
    countryId = params[:country_id]
    if countryId.nil?
      countryId = 1
    end
    @accommodations = getAccommodationsByCountry(countryId)
  end

  def show
    @accommodation = Accommodation.find(params[:id])
  end

  #searchByCountry hotels by country
  def searchByCountry
    countryId = params[:country_id]
    @accommodations = getAccommodationsByCountry(countryId)
    respond_to do |format|
      format.js
    end
  end

  #load next set of results for searchByCountry by country
  def loadMoreResults
    countryId = params[:more_country_id]
    @accommodations = getAccommodationsByCountry(countryId)
    respond_to do |format|
      format.js
    end
  end

  #searchByCountry hotels by name
  def searchByHotelName
    @accommodations = getAccommodationById(params[:hotel_id])
    respond_to do |format|
      format.js
    end
  end

  def getAccommodationsByCountry(id)
    return Accommodation.where('country_id =?', id).paginate(:page => params[:page],:per_page => 8)
  end

  def getAccommodationById(id)
    return Accommodation.where('accommodation_id = ?', id)
  end

  private :getAccommodationsByCountry, :getAccommodationById

end
