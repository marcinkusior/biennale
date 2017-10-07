class Admin::PartnersController < ApplicationController
  before_action :set_partner, only: [:show, :edit, :update, :destroy]

  before_filter :authorize

  def index
    @kinds = { 'media' => 'medialny', 'honor' => 'honorowy', 'normal' => 'zwykły', 'organizer' => 'organizator' }
    @partners = Partner.all.order(id: :desc)
  end

  def show
  end

  def new
    @partner = Partner.new()
  end

  def edit
  end

  def create
    @partner = Partner.new(partner_params)

    respond_to do |format|
      if @partner.save
        format.html { redirect_to [:admin, @partner.partner_category], notice: 'Partner was successfully created.' }
        format.json { render action: 'show', status: :created, location: @partner }
      else
        format.html { render action: 'new' }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @partner.update(partner_params)
        format.html { redirect_to [:admin, @partner.partner_category], notice: 'Partner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @partner.destroy
    respond_to do |format|
      format.html { redirect_to [:admin, @partner.partner_category], notice: 'Partner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_order
    ids = params[:object][:ids]
    order = params[:object][:order]
    ids.each_with_index do |id, idx|
      Partner.find(id).update(order: order[idx])
    end

    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Updated successfully' }
      format.json {  }
    end
  end

  private
    def set_partner
      @partner = Partner.find(params[:id])
    end

    def partner_params
      params.require(:partner).permit(:name, :image, :partner_category_id, :url)
    end
end
