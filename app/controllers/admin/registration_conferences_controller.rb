class Admin::RegistrationConferencesController < ApplicationController
  before_action :set_registration_conference, only: [:show, :edit, :update, :destroy]
  
  before_filter :authorize

  # GET /admin/registration_conferences
  # GET /admin/registration_conferences.json
  def index
    @registration_conferences = RegistrationConference.all
  end

  # GET /admin/registration_conferences/1
  # GET /admin/registration_conferences/1.json
  def show
  end

  # GET /admin/registration_conferences/new
  def new
    @registration_conference = RegistrationConference.new
  end

  # GET /admin/registration_conferences/1/edit
  def edit
  end

  # POST /admin/registration_conferences
  # POST /admin/registration_conferences.json
  def create
    @registration_conference = RegistrationConference.new(registration_conference_params)

    respond_to do |format|
      if @registration_conference.save
        format.html { redirect_to [:admin, @registration_conference], notice: 'Registration conference was successfully created.' }
        format.json { render action: 'show', status: :created, location: @registration_conference }
      else
        format.html { render action: 'new' }
        format.json { render json: @registration_conference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/registration_conferences/1
  # PATCH/PUT /admin/registration_conferences/1.json
  def update
    respond_to do |format|
      if @registration_conference.update(registration_conference_params)
        format.html { redirect_to [:admin, @registration_conference], notice: 'Registration conference was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @registration_conference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/registration_conferences/1
  # DELETE /admin/registration_conferences/1.json
  def destroy
    @registration_conference.destroy
    respond_to do |format|
      format.html { redirect_to admin_registration_conferences_url, notice: 'Registration conference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_all
    RegistrationConference.delete_all
    respond_to do |format|
      format.html { redirect_to admin_registration_conferences_path }
      format.json { head :no_content }
    end
  end

  def archive
    archive = Archive.find(params['archive_id'])
    params[:record_ids].each do |id|
      registration = RegistrationConference.find(id)
      @record = archive.records.build
      @record.title = "#{registration.first_name.capitalize} #{registration.last_name.capitalize} \"#{registration.subject}\""

      if registration.university == nil
        @record.body = " <h6> #{registration.first_name.capitalize} #{registration.last_name.capitalize} <br> \"#{registration.subject}\"</h6>"
        @record.bodyPL = " <h6> #{registration.first_name.capitalize} #{registration.last_name.capitalize} <br> \"#{registration.subject}\"</h6>"
      else
        @record.body = " <h6> #{registration.first_name.capitalize} #{registration.last_name.capitalize} (#{registration.university}) <br> \"#{registration.subject}\"</h6>"
        @record.bodyPL = " <h6> #{registration.first_name.capitalize} #{registration.last_name.capitalize} (#{registration.university}) <br> \"#{registration.subject}\"</h6>"
      end
    end
    archive.save
    redirect_to "/admin/archives"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration_conference
      @registration_conference = RegistrationConference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_conference_params
      params.require(:registration_conference).permit(:first_name, :last_name, :telephone, :street, :city, :zip_code, :country, :university, :subject, :email, :terms_of_service)
    end
end
