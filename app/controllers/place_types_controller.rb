class PlaceTypesController < ApplicationController
  def index
    @place_types = PlaceType.page(params[:page]).per(10)

    render("place_types/index.html.erb")
  end

  def show
    @place = Place.new
    @place_type = PlaceType.find(params[:id])

    render("place_types/show.html.erb")
  end

  def new
    @place_type = PlaceType.new

    render("place_types/new.html.erb")
  end

  def create
    @place_type = PlaceType.new

    @place_type.place_type = params[:place_type]

    save_status = @place_type.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/place_types/new", "/create_place_type"
        redirect_to("/place_types")
      else
        redirect_back(:fallback_location => "/", :notice => "Place type created successfully.")
      end
    else
      render("place_types/new.html.erb")
    end
  end

  def edit
    @place_type = PlaceType.find(params[:id])

    render("place_types/edit.html.erb")
  end

  def update
    @place_type = PlaceType.find(params[:id])

    @place_type.place_type = params[:place_type]

    save_status = @place_type.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/place_types/#{@place_type.id}/edit", "/update_place_type"
        redirect_to("/place_types/#{@place_type.id}", :notice => "Place type updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Place type updated successfully.")
      end
    else
      render("place_types/edit.html.erb")
    end
  end

  def destroy
    @place_type = PlaceType.find(params[:id])

    @place_type.destroy

    if URI(request.referer).path == "/place_types/#{@place_type.id}"
      redirect_to("/", :notice => "Place type deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Place type deleted.")
    end
  end
end
