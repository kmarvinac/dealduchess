class DealsController < ApplicationController
  def index
    @q = Deal.ransack(params[:q])
    @deals = @q.result(:distinct => true).includes(:place).page(params[:page]).per(10)

    render("deals/index.html.erb")
  end

  def show
    @deal = Deal.find(params[:id])

    render("deals/show.html.erb")
  end

  def new
    @deal = Deal.new

    render("deals/new.html.erb")
  end

  def create
    @deal = Deal.new

    @deal.discount_type = params[:discount_type]
    @deal.terms_of_deal = params[:terms_of_deal]
    @deal.day_of_week = params[:day_of_week]
    @deal.place_id = params[:place_id]

    save_status = @deal.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/deals/new", "/create_deal"
        redirect_to("/deals")
      else
        redirect_back(:fallback_location => "/", :notice => "Deal created successfully.")
      end
    else
      render("deals/new.html.erb")
    end
  end

  def edit
    @deal = Deal.find(params[:id])

    render("deals/edit.html.erb")
  end

  def update
    @deal = Deal.find(params[:id])

    @deal.discount_type = params[:discount_type]
    @deal.terms_of_deal = params[:terms_of_deal]
    @deal.day_of_week = params[:day_of_week]
    @deal.place_id = params[:place_id]

    save_status = @deal.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/deals/#{@deal.id}/edit", "/update_deal"
        redirect_to("/deals/#{@deal.id}", :notice => "Deal updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Deal updated successfully.")
      end
    else
      render("deals/edit.html.erb")
    end
  end

  def destroy
    @deal = Deal.find(params[:id])

    @deal.destroy

    if URI(request.referer).path == "/deals/#{@deal.id}"
      redirect_to("/", :notice => "Deal deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Deal deleted.")
    end
  end
end
