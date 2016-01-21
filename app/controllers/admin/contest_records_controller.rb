class Admin::ContestRecordsController < ApplicationController
  before_action :set_contest_record, only: [:show, :edit, :update, :destroy]

  before_filter :authorize

  # GET /admin/contest_records
  # GET /admin/contest_records.json
  def index
    @contest_records = ContestRecord.all
  end

  # GET /admin/contest_records/1
  # GET /admin/contest_records/1.json
  def show
  end

  # GET /admin/contest_records/new
  def new
    @contest_record = ContestRecord.new
    3.times{ @contest_record.public_images.build }
  end

  # GET /admin/contest_records/1/edit
  def edit
  end

  # POST /admin/contest_records
  # POST /admin/contest_records.json
  def create
    @contest_record = ContestRecord.new(contest_record_params)

    respond_to do |format|
      if @contest_record.save
        format.html { redirect_to "/admin/contest_archives/#{@contest_record.contest_archive_id}/edit", notice: 'Contest record was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contest_record }
      else
        format.html { render action: 'new' }
        format.json { render json: @contest_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/contest_records/1
  # PATCH/PUT /admin/contest_records/1.json
  def update
    respond_to do |format|
      if @contest_record.update(contest_record_params)
        format.html { redirect_to "/admin/contest_archives/#{@contest_record.contest_archive_id}/edit", notice: 'Contest record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contest_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/contest_records/1
  # DELETE /admin/contest_records/1.json
  def destroy
    @contest_record.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Contest record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_order
    ids = params[:object][:ids]
    order = params[:object][:order]
    ids.each_with_index do |id, idx|
      ContestRecord.find(id).update(order_position: order[idx])
    end

    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Updated successfully' }
      format.json {  }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contest_record
      @contest_record = ContestRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contest_record_params
      params.require(:contest_record).permit(:title, :titlePL, :body, :bodyPL, :contest_archive_id, :serial, public_images_attributes: [:src, :contest_record_id])
    end
end
