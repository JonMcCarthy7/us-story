class EntriesController < ApplicationController
  before_action :set_entry, only: %i[ show edit update destroy ]

  # GET /entries or /entries.json
  def index
    @entries = current_user.entries.where(type: nil).order(start_date: :desc)
  end

  # GET /entries/1 or /entries/1.json
  def show
    # @child_entries = @entry.child_entries.with_attached_images.order(start_date: :asc)
  end

  # GET /entries/new
  def new
    @entry = Entry.new
  end

  # GET /entries/1/edit
  def edit
    set_media_files
  end

  # POST /entries or /entries.json
  def create
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: "Entry was successfully created." }
        format.json { render :show, status: :created, location: @entry }
      else
        set_media_files
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1 or /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: "Entry was successfully updated." }
        format.json { render :show, status: :ok, location: @entry }
      else
        set_media_files
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1 or /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: "Entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entry
    @entry = Entry.find(params[:id])
  end

  def set_media_files
    @media_files_json = json_mock_files(@entry.images)
  end

  # Only allow a list of trusted parameters through.
  def entry_params
    params.require(:entry).permit(
      :title,
      :description,
      :start_date,
      :end_date,
      :event_type,
      :status,
      :content,
      :main_image,
      images: []
    ).merge(user: current_user, relationship: current_relationship)
  end
end

