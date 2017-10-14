class Admin::ContestArchivesController < ApplicationController
  before_action :set_contest_archive, only: [:show, :edit, :update, :destroy]

  before_filter :authorize

  # GET /admin/contest_archives
  # GET /admin/contest_archives.json
  def index
    @contest_archives = ContestArchive.all
  end

  # GET /admin/contest_archives/1
  # GET /admin/contest_archives/1.json
  def show
  end

  # GET /admin/contest_archives/new
  def new
    @contest_archive = ContestArchive.new
  end

  # GET /admin/contest_archives/1/edit
  def edit
  end

  # POST /admin/contest_archives
  # POST /admin/contest_archives.json
  def create
    @contest_archive = ContestArchive.new(contest_archive_params)

    respond_to do |format|
      if @contest_archive.save
        format.html { redirect_to "/admin/contest_archives", notice: 'Contest archive was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contest_archive }
      else
        format.html { render action: 'new' }
        format.json { render json: @contest_archive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/contest_archives/1
  # PATCH/PUT /admin/contest_archives/1.json
  def update
    respond_to do |format|
      if @contest_archive.update(contest_archive_params)
        format.html { redirect_to "/admin/contest_archives", notice: 'Contest archive was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contest_archive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/contest_archives/1
  # DELETE /admin/contest_archives/1.json
  def destroy
    @contest_archive.destroy
    respond_to do |format|
      format.html { redirect_to admin_contest_archives_url, notice: 'Contest archive was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_order
    ids = params[:object][:ids]
    order = params[:object][:order]
    ids.each_with_index do |id, idx|
      ContestArchive.find(id).update(order: order[idx])
    end

    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Updated successfully' }
      format.json {  }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contest_archive
      @contest_archive = ContestArchive.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contest_archive_params
      params.require(:contest_archive).permit(:title, :titlePL)
    end
end
