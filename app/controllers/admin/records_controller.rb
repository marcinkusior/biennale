class Admin::RecordsController < ApplicationController
  before_action :set_record, only: [:show, :edit, :update, :destroy]

  before_filter :authorize

  # GET /admin/records
  # GET /admin/records.json
  def index
    @records = Record.all
  end

  # GET /admin/records/1
  # GET /admin/records/1.json
  def show
  end

  # GET /admin/records/new
  def new
    @record = Record.new
  end

  # GET /admin/records/1/edit
  def edit
  end

  # POST /admin/records
  # POST /admin/records.json
  def create
    @record = Record.new(record_params)

    respond_to do |format|
      if @record.save
        format.html { redirect_to "/admin/archives/#{@record.archive_id}/edit", notice: 'Record was successfully created.' }
        format.json { render action: 'show', status: :created, location: @record }
      else
        format.html { render action: 'new' }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/records/1
  # PATCH/PUT /admin/records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to "/admin/archives/#{@record.archive_id}/edit", notice: 'Record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/records/1
  # DELETE /admin/records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:body, :bodyPL, :titlePL, :title, :archive_id)
    end
end
