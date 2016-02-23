class Admin::RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :edit, :update, :destroy]

  before_filter :authorize

  # GET /admin/registrations
  # GET /admin/registrations.json
  def index
    @registrations = Registration.all
  end

  # GET /admin/registrations/1
  # GET /admin/registrations/1.json
  def show
  end

  # GET /admin/registrations/new
  def new
    @registration = Registration.new
     3.times { @registration.images.build}
  end

  # GET /admin/registrations/1/edit
  def edit
    
  end

  # POST /admin/registrations
  # POST /admin/registrations.json
  def create
    @registration = Registration.new(registration_params)

    respond_to do |format|
      if @registration.save
        format.html { redirect_to [:admin, @registration], notice: 'Registration was successfully created.' }
        format.json { render action: 'show', status: :created, location: @registration }
      else
        format.html { 
        @registration.images = [];
         3.times { @registration.images.build}; render action: :new
       }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/registrations/1
  # PATCH/PUT /admin/registrations/1.json
  def update
    respond_to do |format|
      if @registration.update(registration_params)
        format.html { redirect_to [:admin, @registration], notice: 'Registration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/registrations/1
  # DELETE /admin/registrations/1.json
  def destroy
    @registration.destroy
    respond_to do |format|
      format.html { redirect_to "/admin/registrations", notice: 'Registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_all
    Registration.destroy_all
    respond_to do |format|
      format.html { redirect_to admin_registrations_path }
      format.json { head :no_content }
    end
  end

  def archive
    archive = ContestArchive.find(params[:archive_id])
    params[:record_ids].each do |id|
      registration = Registration.find(id)
      @record = archive.contest_records.build
      @record.title = registration.first_name + ' ' + registration.last_name
      @record.serial = registration.serial
      registration.images.each do |image|
        public_image = @record.public_images.build
        public_image.src = File.new( image.src.to_s )
      end
    end
    archive.save
    redirect_to "/admin/registrations", notice: 'Registrations were successfully archived'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:first_name, :last_name, :telephone, :street, :city, :zip_code, :country, :university, :supervising_professor, :email, :terms_of_service, :serial, :group_name, images_attributes: [ :src, :registration_id])
    end
end
