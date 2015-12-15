class Admin::AdministratorsController < ApplicationController
  before_action :set_administrator, only: [:show, :edit, :update, :destroy]
  before_filter :authorize

  # GET /admin/administrators
  # GET /admin/administrators.json
  def index
    @administrators = Administrator.all
  end

  # GET /admin/administrators/1
  # GET /admin/administrators/1.json
  def show
  end

  # GET /admin/administrators/new
  def new
    @administrator = Administrator.new
  end

  # GET /admin/administrators/1/edit
  def edit
  end

  # POST /admin/administrators
  # POST /admin/administrators.json
  def create
    @administrator = Administrator.new(administrator_params)

    respond_to do |format|
      if @administrator.save
        format.html { redirect_to [:admin, @administrator], notice: 'Administrator was successfully created.' }
        format.json { render action: 'show', status: :created, location: @administrator }
      else
        format.html { render action: 'new' }
        format.json { render json: @administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/administrators/1
  # PATCH/PUT /admin/administrators/1.json
  def update
    respond_to do |format|
      if @administrator.update(administrator_params)
        format.html { redirect_to [:admin, @administrator], notice: 'Administrator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/administrators/1
  # DELETE /admin/administrators/1.json
  def destroy
    @administrator.destroy
    respond_to do |format|
      format.html { redirect_to admin_administrators_url, notice: 'Administrator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administrator
      @administrator = Administrator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def administrator_params
      params.require(:administrator).permit(:name, :email, :password, :password_confirmation)
    end
end
