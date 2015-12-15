class Admin::ParagraphsController < ApplicationController
  before_action :set_paragraph, only: [:show, :edit, :update, :destroy]

  before_filter :authorize

  # GET /admin/paragraphs
  # GET /admin/paragraphs.json
  def index
    @paragraphs = Paragraph.all
  end

  # GET /admin/paragraphs/1
  # GET /admin/paragraphs/1.json
  def show
  end

  # GET /admin/paragraphs/new
  def new
    @paragraph = Paragraph.new
  end

  # GET /admin/paragraphs/1/edit
  def edit
  end

  # POST /admin/paragraphs
  # POST /admin/paragraphs.json
  def create
    @paragraph = Paragraph.new(paragraph_params)

    respond_to do |format|
      if @paragraph.save
        format.html { redirect_to [:admin, @paragraph], notice: 'Paragraph was successfully created.' }
        format.json { render action: 'show', status: :created, location: @paragraph }
      else
        format.html { render action: 'new' }
        format.json { render json: @paragraph.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/paragraphs/1
  # PATCH/PUT /admin/paragraphs/1.json
  def update
    respond_to do |format|
      if @paragraph.update(paragraph_params)
        format.html { redirect_to [:admin, @paragraph], notice: 'Paragraph was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @paragraph.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/paragraphs/1
  # DELETE /admin/paragraphs/1.json
  def destroy
    @paragraph.destroy
    respond_to do |format|
      format.html { redirect_to admin_paragraphs_url, notice: 'Paragraph was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paragraph
      @paragraph = Paragraph.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paragraph_params
      params.require(:paragraph).permit(:body, :bodyPL, :page_id)
    end
end
