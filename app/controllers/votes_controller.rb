class VotesController < ApplicationController
  def create
    # render json: 'spierdalaj' if unique_ip(params['ip_address']) == false
    redirect_to('/Biennial') and return if unique_ip(params['ip_address']) == false

    @vote = Vote.new(ip_address: params['ip_address'], contest_record_id: params['contest_record_id'] )

    respond_to do |format|
      if @vote.save
        # format.html { redirect_to [:admin, @vote], notice: 'Vote was successfully created.' }
        format.json { render json: @vote}
      else
        # format.html { render action: 'new' }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end




    private

    def unique_ip(ip)
      votes = []
      Vote.all.each{|vote| votes << vote.ip_address }
      votes.find_index(ip) == nil
    end

    def vote_params
       params.require(:vote).permit(:ip_address, :contest_record_id)
    end


end
