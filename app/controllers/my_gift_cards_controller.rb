class MyGiftCardsController < ApplicationController
  before_action :current_user_must_be_my_gift_card_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_my_gift_card_user
    my_gift_card = MyGiftCard.find(params[:id])

    unless current_user == my_gift_card.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.my_gift_cards.ransack(params[:q])
      @my_gift_cards = @q.result(:distinct => true).includes(:user, :place).page(params[:page]).per(10)

    render("my_gift_cards/index.html.erb")
  end

  def show
    @my_gift_card = MyGiftCard.find(params[:id])

    render("my_gift_cards/show.html.erb")
  end

  def new
    @my_gift_card = MyGiftCard.new

    render("my_gift_cards/new.html.erb")
  end

  def create
    @my_gift_card = MyGiftCard.new

    @my_gift_card.place_id = params[:place_id]
    @my_gift_card.expiration_date = params[:expiration_date]
    @my_gift_card.card_image = params[:card_image]
    @my_gift_card.user_id = params[:user_id]

    save_status = @my_gift_card.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/my_gift_cards/new", "/create_my_gift_card"
        redirect_to("/my_gift_cards")
      else
        redirect_back(:fallback_location => "/", :notice => "My gift card created successfully.")
      end
    else
      render("my_gift_cards/new.html.erb")
    end
  end

  def edit
    @my_gift_card = MyGiftCard.find(params[:id])

    render("my_gift_cards/edit.html.erb")
  end

  def update
    @my_gift_card = MyGiftCard.find(params[:id])

    @my_gift_card.place_id = params[:place_id]
    @my_gift_card.expiration_date = params[:expiration_date]
    @my_gift_card.card_image = params[:card_image]
    @my_gift_card.user_id = params[:user_id]

    save_status = @my_gift_card.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/my_gift_cards/#{@my_gift_card.id}/edit", "/update_my_gift_card"
        redirect_to("/my_gift_cards/#{@my_gift_card.id}", :notice => "My gift card updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "My gift card updated successfully.")
      end
    else
      render("my_gift_cards/edit.html.erb")
    end
  end

  def destroy
    @my_gift_card = MyGiftCard.find(params[:id])

    @my_gift_card.destroy

    if URI(request.referer).path == "/my_gift_cards/#{@my_gift_card.id}"
      redirect_to("/", :notice => "My gift card deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "My gift card deleted.")
    end
  end
end
