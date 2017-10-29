class Admin::NewsaddressesController < ApplicationController
  before_action :set_newsaddress, only: [:show, :edit, :update, :destroy]

  before_filter :authorize

  def registration_conference_mail
    @newsaddresses = Newsaddresse.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsaddress
      @newsaddresse = Newsaddresse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newsaddress_params
      params.require(:newsaddresse).permit(:email)
    end
end
