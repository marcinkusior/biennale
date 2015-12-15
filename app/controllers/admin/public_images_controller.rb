class Admin::PublicImagesController < ApplicationController
  before_action :set_public_image, only: [:show, :edit, :update, :destroy]

  before_filter :authorize
  
  # GET /admin/public_images
  # GET /admin/public_images.json
  def index
    @public_images = PublicImage.all
  end

  # GET /admin/public_images/1
  # GET /admin/public_images/1.json
  def show
  end

  # GET /admin/public_images/new
  def new
    @public_image = PublicImage.new
  end

  # GET /admin/public_images/1/edit
  def edit
  end

  # POST /admin/public_images
  # POST /admin/public_images.json
  def create
    @public_image = PublicImage.new(public_image_params)

    respond_to do |format|
      if @public_image.save
        format.html { redirect_to "/admin/contest_records/#{@public_image.contest_record_id}/edit", notice: 'Public image was successfully created.' }
        format.json { render action: 'show', status: :created, location: @public_image }
      else
        format.html { render action: 'new' }
        format.json { render json: @public_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/public_images/1
  # PATCH/PUT /admin/public_images/1.json
  def update
    respond_to do |format|
      if @public_image.update(public_image_params)
        format.html { redirect_to request.referer, notice: 'Public image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @public_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/public_images/1
  # DELETE /admin/public_images/1.json
  def destroy
    @public_image.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Public image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_public_image
      @public_image = PublicImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def public_image_params
      params.require(:public_image).permit(:contest_record_id, :src)
    end
end
