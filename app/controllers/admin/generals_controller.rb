class Admin::GeneralsController < ApplicationController
  before_action :set_general, only: [:show, :edit, :update, :destroy]

  before_filter :authorize

  # GET /admin/generals
  # GET /admin/generals.json
  def index
    @generals = General.all
  end

  # GET /admin/generals/1
  # GET /admin/generals/1.json
  def show
  end

  # GET /admin/generals/new
  def new
    @general = General.new
  end

  # GET /admin/generals/1/edit
  def edit
  end

  # POST /admin/generals
  # POST /admin/generals.json
  def create
    @general = General.new(general_params)

    respond_to do |format|
      if @general.save
        format.html { redirect_to [:admin, @general], notice: 'General was successfully created.' }
        format.json { render action: 'show', status: :created, location: @general }
      else
        format.html { render action: 'new' }
        format.json { render json: @general.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/generals/1
  # PATCH/PUT /admin/generals/1.json
  def update
    respond_to do |format|
      if @general.update(general_params)
        format.html { redirect_to "/admin/generals/#{@general.id}/edit", notice: 'Update successful.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @general.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/generals/1
  # DELETE /admin/generals/1.json
  def destroy
    @general.destroy
    respond_to do |format|
      format.html { redirect_to admin_generals_url, notice: 'General was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def settings
    redirect_to "/admin/generals/1/edit"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_general
      @general = General.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def general_params
      params.require(:general).permit(:edition_no, :primary_color, :secondary_color, :block_site,
                                      :registration_conference, :registration_contest, :voting_contest,
                                      :partners_on, :program_on, :results_on, :archive_on, :voting_on,
                                      :contest_archive_on, :contest_archive_id, :map_zoom, :marker_id,
                                      :primary_banner, :secondary_banner, :favicon, :registration_contest_mail,
                                      :registration_conference_mail, :registration_contest_mail_PL,
                                      :registration_conference_mail_PL)
    end
end
