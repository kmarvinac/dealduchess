class PlacesController < ApplicationController
  before_action :current_user_must_be_place_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_place_user
    place = Place.find(params[:id])

    unless current_user == place.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.places.ransack(params[:q])
      @places = @q.result(:distinct => true).includes(:user, :deals, :my_gift_cards, :place_type, :neighborhood).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@places.where.not(:address_latitude => nil)) do |place, marker|
      marker.lat place.address_latitude
      marker.lng place.address_longitude
      marker.infowindow "<h5><a href='/places/#{place.id}'>#{place.created_at}</a></h5><small>#{place.address_formatted_address}</small>"
    end

    render("places/index.html.erb")
  end

  def show
    @my_gift_card = MyGiftCard.new
    @deal = Deal.new
    @place = Place.find(params[:id])

    render("places/show.html.erb")
  end

  def new
    @place = Place.new

    render("places/new.html.erb")
  end

  def create
    @place = Place.new

    @place.place_name = params[:place_name]
    @place.address = params[:address]
    @place.city = params[:city]
    @place.state = params[:state]
    @place.zip = params[:zip]
    @place.neighborhood_id = params[:neighborhood_id]
    @place.place_type_id = params[:place_type_id]
    @place.user_id = params[:user_id]
    @place.comments = params[:comments]

    save_status = @place.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/places/new", "/create_place"
        redirect_to("/places")
      else
        redirect_back(:fallback_location => "/", :notice => "Place created successfully.")
      end
    else
      render("places/new.html.erb")
    end
  end

  def edit
    @place = Place.find(params[:id])

    render("places/edit.html.erb")
  end

  def update
    @place = Place.find(params[:id])

    @place.place_name = params[:place_name]
    @place.address = params[:address]
    @place.city = params[:city]
    @place.state = params[:state]
    @place.zip = params[:zip]
    @place.neighborhood_id = params[:neighborhood_id]
    @place.place_type_id = params[:place_type_id]
    @place.user_id = params[:user_id]
    @place.comments = params[:comments]

    save_status = @place.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/places/#{@place.id}/edit", "/update_place"
        redirect_to("/places/#{@place.id}", :notice => "Place updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Place updated successfully.")
      end
    else
      render("places/edit.html.erb")
    end
  end

  def destroy
    @place = Place.find(params[:id])

    @place.destroy

    if URI(request.referer).path == "/places/#{@place.id}"
      redirect_to("/", :notice => "Place deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Place deleted.")
    end
  end
end
