class Admin::PartnerCategoriesController < ApplicationController
  before_action :set_partner_category, only: [:show, :edit, :update, :destroy]

  def index
    @partner_categories = PartnerCategory.all
  end

  def show
  end

  def new
    @partner_category = PartnerCategory.new
  end

  def edit
  end

  def create
    @partner_category = PartnerCategory.new(partner_category_params)

    respond_to do |format|
      if @partner_category.save
        format.html { redirect_to [:admin, @partner_category], notice: 'Partner category was successfully created.' }
        format.json { render :show, status: :created, location: @partner_category }
      else
        format.html { render :new }
        format.json { render json: @partner_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @partner_category.update(partner_category_params)
        format.html { redirect_to admin_partner_categories_url, notice: 'Partner category was successfully updated.' }
        format.json { render :show, status: :ok, location: @partner_category }
      else
        format.html { render :edit }
        format.json { render json: @partner_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @partner_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_partner_categories_url, notice: 'Partner category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_order
    ids = params[:object][:ids]
    order = params[:object][:order]
    ids.each_with_index do |id, idx|
      PartnerCategory.find(id).update(order: order[idx])
    end

    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Updated successfully' }
      format.json {  }
    end
  end

  private
    def set_partner_category
      @partner_category = PartnerCategory.find(params[:id])
    end

    def partner_category_params
      params.require(:partner_category).permit(:name, :namePl)
    end
end
