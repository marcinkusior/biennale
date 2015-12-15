class RegistrationsController < ApplicationController
  def new
	   @registration = Registration.new
     3.times { @registration.images.build}
  end

  def create
  	@registration = Registration.new(registration_params)

    respond_to do |format|
      if @registration.save
        format.html { redirect_to root_path, notice: 'Registration was successfully created.' }
        format.json {  }
        
        RegisterMail.register_success_mail(@registration).deliver_now
        RegisterMail.backup_mail(@registration).deliver_now
      else
        format.html { 
        @registration.images = [];
         3.times { @registration.images.build};
          render action: :new
       }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  def fetch_images
    id = params['registration_id']
    images = Registration.find(id).images
    respond_to do |format|
      format.json { render json: images } 
    end
  end


  
  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:first_name, :last_name, :telephone, :street, :city, :zip_code, :country, :university, :supervising_professor, :email, :terms_of_service, :serial, :group_name, images_attributes: [ :src, :registration_id])
    end
  
end
