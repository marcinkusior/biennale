class RegistrationConferencesController < ApplicationController
  def new
	    @registration = RegistrationConference.new
  end

  def create
  	@registration = RegistrationConference.new(registration_params)

    respond_to do |format|
      if @registration.save
        format.html { redirect_to root_path, notice: 'Registration was successfully created.' }
        format.json { render action: 'show', status: :created, location: @registration }


        RegisterMail.register_conference_success_mail(@registration).deliver_now
        RegisterMail.conference_backup_mail(@registration).deliver_now
      else
        format.html {
          render action: :new
        }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end


  
  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration_conference).permit(:first_name, :last_name, :telephone, :street, :city, :zip_code, :country, :university, :email, :terms_of_service, :subject, :attachment )
    end
end
