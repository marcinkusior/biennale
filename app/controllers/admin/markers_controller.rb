class Admin::MarkersController < ApplicationController
  before_action :set_marker, only: [:show, :edit, :update, :destroy]

  before_filter :authorize

  # GET /admin/markers
  # GET /admin/markers.json
  def index
    @markers = Marker.all
  end

  # GET /admin/markers/1
  # GET /admin/markers/1.json
  def show
  end

  # GET /admin/markers/new
  def new
    @marker = Marker.new
  end

  # GET /admin/markers/1/edit
  def edit
  end

  # POST /admin/markers
  # POST /admin/markers.json
  def create
    @marker = Marker.new(marker_params)

    respond_to do |format|
      if @marker.save
        format.html { redirect_to '/admin/markers', notice: 'Marker was successfully created.' }
        format.json { render action: 'show', status: :created, location: @marker }
      else
        format.html { render action: 'new' }
        format.json { render json: @marker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/markers/1
  # PATCH/PUT /admin/markers/1.json
  def update
    respond_to do |format|
      if @marker.update(marker_params)
        format.html { redirect_to '/admin/markers', notice: 'Marker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @marker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/markers/1
  # DELETE /admin/markers/1.json
  def destroy
    @marker.destroy
    respond_to do |format|
      format.html { redirect_to admin_markers_url, notice: 'Marker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marker
      @marker = Marker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def marker_params
      params.require(:marker).permit(:lat, :lng, :desc)
    end
end
