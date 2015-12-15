class GalleriesController < ApplicationController
  def fetch_record
  	id = params['record_id']
    object = ContestRecord.find(id)
    objects = object.public_images.order('id')
    body = params['locale'] == 'en' ? object.body : object.bodyPL
    respond_to do |format|
      format.json { render json: [body ,objects] } 
    end
  end

  def fetch_records
    ids = params['ids']
    objects = []

    ids.each do |id|
      object = ContestRecord.find(id)
      objects << [object.public_images.first, object.serial, object.votes.length]
    end

    respond_to do |format|
      format.json { render json: objects } 
    end
  end

end
