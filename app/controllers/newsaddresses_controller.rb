class NewsaddressesController < ApplicationController
  def create
    session[:return_to] ||= request.referer
    @newsaddress = Newsaddresse.new(newsaddress_params)

    respond_to do |format|
      if @newsaddress.save
        format.html { redirect_to session.delete(:return_to) }
        format.json { render action: 'show', status: :created, location: @newsaddress }
      else
        format.html { redirect_to session.delete(:return_to)}
        format.json { render json: @newsaddress.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def newsaddress_params
    params.require(:newsaddresse).permit(:email)
  end
end
