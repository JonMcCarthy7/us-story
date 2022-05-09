class FilesController < ApplicationController

  def create
    @file = if params[:signed_id].present?
              ActiveStorage::Blob.find_signed(params[:signed_id])
            else
              ActiveStorage::Attachment.find(params[:attachment_id])
            end
    @file.purge_later
    render status: :ok, json: { message: 'Successfully Deleted File' }
  end
end