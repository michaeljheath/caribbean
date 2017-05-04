class AccommodationsController < ApplicationController
  #protect_from_forgery except: :searchByCountry

  #return data for hotel name autocomplete
  def autocomplete
    hotelsHash = []
    hotels = Accommodation.where('name LIKE ?', "%#{params[:query]}%").order(:name).pluck(:name, :accommodation_id)

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
      countryId = '1' #default it
    end
    @accommodations = getAccommodationsByCountry(countryId)
  end

  def show
    @accommodation = Accommodation.friendly.find(params[:id])
  end

  # hotels by country
  def searchByCountry
    countryId = params[:country_id]
    @accommodations = getAccommodationsByCountry(countryId)
    respond_to do |format|
      format.js
    end
  end

  # hotels by destination
  def searchByDestination
    destinationId = params[:destination_id]
    @accommodations = getAccommodationsByDestination(destinationId)
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

  #load next set of results
  def loadMoreResults

    #defaults
    geoId = params[:geo_id]
    searchType = params[:search_type]

    if geoId.nil?
      geoId = 1
    end
    if searchType.nil?
      searchType = 'country'
    end

    if searchType == 'country'
      @accommodations = getAccommodationsByCountry(geoId)
    elsif searchType == 'destination'
      @accommodations = getAccommodationsByDestination(geoId)
    elsif searchType == 'location'
      @accommodations = getAccommodationsByLocation(geoId)
    end
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

  #private methods
  def getAccommodationsByCountry(id)

    return Accommodation.find_by_sql('SELECT accommodation.accommodation_id, accommodation.name, accommodation.affiliate_url, accommodation.photo_file_name, accommodation.slug
                                                FROM accommodation
                                                INNER JOIN location ON location.location_id = accommodation.location_id
                                                INNER JOIN destination ON destination.destination_id = location.destination_id
                                                INNER JOIN country ON country.country_id = destination.country_id
                                                WHERE country.country_id = ' + id  + ' AND accommodation.show_listings = 1 ORDER BY accommodation.name ASC')
                                                .paginate(:page => params[:page],:per_page => 50)
  end

  def getAccommodationsByDestination(id)

    return Accommodation.find_by_sql('SELECT accommodation.accommodation_id, accommodation.name, accommodation.affiliate_url, accommodation.photo_file_name, accommodation.slug
                                                FROM accommodation
                                                INNER JOIN location ON location.location_id = accommodation.location_id
                                                INNER JOIN destination ON destination.destination_id = location.destination_id
                                                WHERE destination.destination_id = ' + id + ' AND accommodation.show_listings = 1 ORDER BY accommodation.name ASC')
                                                .paginate(:page => params[:page],:per_page => 50)
  end

  def getAccommodationsByLocation(id)
    return Accommodation.where('location_id =? AND show_listings = 1', id).order(:name).paginate(:page => params[:page],:per_page => 50)
  end

  def getAccommodationById(id)
    return Accommodation.where('accommodation_id = ?', id)
  end

  private :getAccommodationsByLocation, :getAccommodationById, :getAccommodationsByCountry

end
