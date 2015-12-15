class Admin::NewsaddressesController < ApplicationController
  before_action :set_newsaddress, only: [:show, :edit, :update, :destroy]

  before_filter :authorize

  # GET /admin/newsaddresses
  # GET /admin/newsaddresses.json
  def index
    @newsaddresses = Newsaddresse.all
  end

  # GET /admin/newsaddresses/1
  # GET /admin/newsaddresses/1.json
  def show
  end

  # GET /admin/newsaddresses/new
  def new
    @newsaddresse = Newsaddresse.new
  end

  # GET /admin/newsaddresses/1/edit
  def edit
  end

  # POST /admin/newsaddresses
  # POST /admin/newsaddresses.json
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

  # PATCH/PUT /admin/newsaddresses/1
  # PATCH/PUT /admin/newsaddresses/1.json
  def update
    respond_to do |format|
      if @newsaddresse.update(newsaddress_params)
        format.html { redirect_to [:admin, @newsaddresse], notice: 'Newsaddresse was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @newsaddresse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/newsaddresses/1
  # DELETE /admin/newsaddresses/1.json
  def destroy
    @newsaddresse.destroy
    respond_to do |format|
      format.html { redirect_to admin_newsaddresses_url, notice: 'Newsaddresse was successfully destroyed.' }
      format.json { head :no_content }
    end
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
