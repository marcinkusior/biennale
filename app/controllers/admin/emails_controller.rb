class Admin::EmailsController < ApplicationController
  # before_action :set_attachment, only: [:show, :edit, :update, :destroy]
  before_filter :authorize

  def conference
    @general = General.first
  end

  def contest
    @general = General.first
  end
end
