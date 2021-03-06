class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  

  # GET /listings 
  def index
    @listings = Listing.all
  end

  # GET /listings/1 
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings 
  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
      if @listing.save
        redirect_to @listing, notice: 'Listing was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /listings/1 
  def update
    if @listing.update(listing_params)
      redirect_to @listing, notice: 'Listing was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy
    redirect_to listings_url, notice: 'Product was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_listing
    @listing = Listing.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:title, :price, :description, :measurements, :shipping, :availability, :state, :city, :suburb)
    end

 
end
