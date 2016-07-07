class AccommodationCategoriesController < ApplicationController
  before_action :set_accommodation_category, only: [:show, :edit, :update, :destroy]

  # GET /accommodation_categories
  # GET /accommodation_categories.json
  def index
    @accommodation_categories = AccommodationCategory.all
  end

  # GET /accommodation_categories/1
  # GET /accommodation_categories/1.json
  def show
  end

  # GET /accommodation_categories/new
  def new
    @accommodation_category = AccommodationCategory.new
  end

  # GET /accommodation_categories/1/edit
  def edit
  end

  # POST /accommodation_categories
  # POST /accommodation_categories.json
  def create
    @accommodation_category = AccommodationCategory.new(accommodation_category_params)

    respond_to do |format|
      if @accommodation_category.save
        format.html { redirect_to @accommodation_category, notice: 'Accommodation category was successfully created.' }
        format.json { render :show, status: :created, location: @accommodation_category }
      else
        format.html { render :new }
        format.json { render json: @accommodation_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accommodation_categories/1
  # PATCH/PUT /accommodation_categories/1.json
  def update
    respond_to do |format|
      if @accommodation_category.update(accommodation_category_params)
        format.html { redirect_to @accommodation_category, notice: 'Accommodation category was successfully updated.' }
        format.json { render :show, status: :ok, location: @accommodation_category }
      else
        format.html { render :edit }
        format.json { render json: @accommodation_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accommodation_categories/1
  # DELETE /accommodation_categories/1.json
  def destroy
    @accommodation_category.destroy
    respond_to do |format|
      format.html { redirect_to accommodation_categories_url, notice: 'Accommodation category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accommodation_category
      @accommodation_category = AccommodationCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accommodation_category_params
      params.require(:accommodation_category).permit(:name)
    end
end
