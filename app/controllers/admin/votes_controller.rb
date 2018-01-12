class Admin::VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]
  before_filter :authorize

  # GET /admin/votes
  # GET /admin/votes.json
  def index
    @votes = Vote.all
  end

  # GET /admin/votes/1
  # GET /admin/votes/1.json
  def show
  end

  # GET /admin/votes/new
  def new
    @vote = Vote.new
  end

  # GET /admin/votes/1/edit
  def edit
  end

  # POST /admin/votes
  # POST /admin/votes.json
  def create
    @vote = Vote.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to [:admin, @vote], notice: 'Vote was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vote }
      else
        format.html { render action: 'new' }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/votes/1
  # PATCH/PUT /admin/votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to [:admin, @vote], notice: 'Vote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/votes/1
  # DELETE /admin/votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to admin_votes_url, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def results

    gallery_archive_id = General.first.contest_archive_id
    @archives = ContestArchive.where.not(id: gallery_archive_id)
    @gallery_archive = ContestArchive.find(gallery_archive_id) unless gallery_archive_id.blank?
    @gallery_archive_ids = @gallery_archive.contest_records.map{|record| record.id} unless gallery_archive_id.blank?

    # gathering results
    total = Vote.all.length.to_f
    @results = [];
    if General.first.contest_archive_id != nil
      @gallery_archive.contest_records.each do |record|
        @results << [record.serial, (record.votes.length / total * 100).round(1), record.votes.length] if record.votes.length > 0
      end

      @results.sort!{ |a, b| b[1] <=> a[1] }
    end
  end

  def delete_all
    Vote.delete_all
    respond_to do |format|
      format.html { redirect_to admin_results_path, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
       params.require(:vote).permit(:ip_address, :contest_record_id)
    end
end
