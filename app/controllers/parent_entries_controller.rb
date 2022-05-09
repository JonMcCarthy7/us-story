class ParentEntriesController < ApplicationController
  before_action :set_parent_entry, only: %i[show edit update destroy]

  # GET /entries or /entries.json
  def index
    @parent_entries = current_user.parent_entries.order(start_date: :desc)
  end

  # GET /entries/1 or /entries/1.json
  def show
    @child_entries = @parent_entry.child_entries.with_attached_images.order(start_date: :asc)
  end

  # GET /entries/new
  def new
    @parent_entry = ParentEntry.new
  end

  # GET /entries/1/edit
  def edit
    set_media_files
  end

  # POST /entries or /entries.json
  def create
    @parent_entry = ParentEntry.new(parent_entry_params)

    respond_to do |format|
      if @parent_entry.save
        format.html { redirect_to @parent_entry, notice: "Entry was successfully created." }
        format.json { render :show, status: :created, location: @parent_entry }
      else
        set_media_files
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parent_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1 or /entries/1.json
  def update
    respond_to do |format|
      if @parent_entry.update(parent_entry_params)
        format.html { redirect_to @parent_entry, notice: "Entry was successfully updated." }
        format.json { render :show, status: :ok, location: @parent_entry }
      else
        set_media_files
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parent_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1 or /entries/1.json
  def destroy
    @parent_entry.destroy
    respond_to do |format|
      format.html { redirect_to parent_entries_url, notice: "Entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_parent_entry
    @parent_entry = ParentEntry.find(params[:id])
  end

  def set_media_files
    @media_files_json = json_mock_files(@parent_entry.images)
  end

  # Only allow a list of trusted parameters through.
  def parent_entry_params
    params.require(:parent_entry).permit(
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

