class ArchivesController < ApplicationController
  def fetch_records
  	id = params['archive_id']
    records = Archive.find(id).records.order(id: :desc)
    respond_to do |format|
      format.json { render json: records } 
    end
  end

  def fetch_contest_records
    id = params['archive_id']
    records = ContestArchive.find(id).contest_records.order(id: :desc).limit( params['limit'] ).offset(params['offset'])
    images = records.map {|record| record.public_images.first  }
    respond_to do |format|
      format.json { render json: images } 
    end
  end

  def fetch_record_images
    id = params['record_id']
    object = ContestRecord.find(id)
    images = object.public_images.order('id')
    body = params['locale'] == 'en' ? object.body : object.bodyPL
    respond_to do |format|
      format.json { render json: [body, images] } 
    end
  end
end
