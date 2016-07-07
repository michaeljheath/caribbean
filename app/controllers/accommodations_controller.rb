class AccommodationsController < ApplicationController
  #protect_from_forgery except: :searchByCountry

  #return data for hotel name autocomplete
  def autocomplete
    hotelsHash = []
    hotels = Accommodation.where('name LIKE ?', "%#{params[:query]}%").pluck(:name, :accommodation_id).order(:name)

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
    locationId = params[:location_id]
    if locationId.nil?
      locationId = 1
    end
    @accommodations = getAccommodationsByLocation(locationId)
  end

  def show
    @accommodation = Accommodation.find(params[:id])
  end

  # hotels by country
  def searchByCountry
    countryId = params[:country_id]
    #@accommodations = getAccommodationsByDestination(countryId)
    respond_to do |format|
      format.js
    end
  end

  # hotels by destination
  def searchByDestination
    destinationId = params[:destination_id]
    #@accommodations = getAccommodationsByDestination(destinationId)
    respond_to do |format|
      format.js
    end
  end

  # hotels by locations
  def searchByLocation
    locationId = params[:location_id]
    @accommodations = getAccommodationsByLocation(locationId)
    respond_to do |format|
      format.js
    end
  end

  # load next set of results
  def loadMoreResults
    locationId = params[:more_location_id]
    @accommodations = getAccommodationsByLocation(locationId)
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

  def getAccommodationsByLocation(id)
    return Accommodation.where('location_id =?', id).order(:name).paginate(:page => params[:page],:per_page => 8)
  end

  def getAccommodationById(id)
    return Accommodation.where('accommodation_id = ?', id)
  end

  private :getAccommodationsByLocation, :getAccommodationById

end
