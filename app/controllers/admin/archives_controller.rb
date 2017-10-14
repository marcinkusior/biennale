class Admin::ArchivesController < ApplicationController
  before_action :set_archive, only: [:show, :edit, :update, :destroy]

  before_filter :authorize

  # GET /admin/archives
  # GET /admin/archives.json
  def index
    @archives = Archive.all
  end

  # GET /admin/archives/1
  # GET /admin/archives/1.json
  def show
  end

  # GET /admin/archives/new
  def new
    @archive = Archive.new
  end

  # GET /admin/archives/1/edit
  def edit
  end

  # POST /admin/archives
  # POST /admin/archives.json
  def create
    @archive = Archive.new(archive_params)

    respond_to do |format|
      if @archive.save
        format.html { redirect_to "/admin/archives", notice: 'Archive was successfully created.' }
        format.json { render action: 'show', status: :created, location: @archive }
      else
        format.html { render action: 'new' }
        format.json { render json: @archive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/archives/1
  # PATCH/PUT /admin/archives/1.json
  def update
    respond_to do |format|
      if @archive.update(archive_params)
        format.html { redirect_to "/admin/archives", notice: 'Archive was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @archive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/archives/1
  # DELETE /admin/archives/1.json
  def destroy
    @archive.destroy
    respond_to do |format|
      format.html { redirect_to admin_archives_url, notice: 'Archive was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_order
    ids = params[:object][:ids]
    order = params[:object][:order]
    ids.each_with_index do |id, idx|
      Archive.find(id).update(order: order[idx])
    end

    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Updated successfully' }
      format.json {  }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_archive
      @archive = Archive.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def archive_params
      params.require(:archive).permit(:title, :titlePL)
    end
end
