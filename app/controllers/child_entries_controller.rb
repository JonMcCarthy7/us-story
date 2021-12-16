class ChildEntriesController < ApplicationController
  before_action :set_entry
  before_action :set_child_entry, only: %i[ show edit update destroy ]

  def show
  end

  def new
    @child_entry = @entry.child_entries.build
  end

  def edit
  end

  def create
    @child_entry = @entry.child_entries.build(child_entry_params)

    respond_to do |format|
      if @child_entry.save
        format.html { redirect_to entry_child_entry_path(@entry, @child_entry), notice: "Entry was successfully created." }
        format.json { render :show, status: :created, location: @child_entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @child_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @child_entry.update(child_entry_params)
        format.html { redirect_to entry_child_entry_path(@entry, @child_entry), notice: "Entry was successfully updated." }
        format.json { render :show, status: :ok, location: @child_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @child_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @child_entry.destroy
    respond_to do |format|
      format.html { redirect_to entry_url(@entry), notice: "Entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entry
    @entry = Entry.find(params[:entry_id])
  end

  def set_child_entry
    @child_entry = ChildEntry.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def child_entry_params
    params.require(:child_entry).permit(
      :title,
      :description,
      :start_date,
      :end_date,
      :event_type,
      :status,
      :entry_id
    ).merge(user: current_user, relationship: current_user.relationship)
  end
end
