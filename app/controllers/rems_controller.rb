class RemsController < ApplicationController
  before_action :set_rem, only: %i[ show edit update destroy ]

  # GET /rems or /rems.json
  def index
    @rems = current_user.rems.order(created_at: :desc)
  end

  # GET /rems/1 or /rems/1.json
  def show
  end

  # GET /rems/new
  def new
    @rem = current_user.rems.build
  end

  # GET /rems/1/edit
  def edit
  end

  # POST /rems or /rems.json
  def create
    @rem = current_user.rems.new(rem_params)

    respond_to do |format|
      if @rem.save
        format.html { redirect_to rems_path, notice: "Rem was successfully created." }
        format.json { render :show, status: :created, location: @rem }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rems/1 or /rems/1.json
  def update
    respond_to do |format|
      if @rem.update(rem_params)
        format.html { redirect_to rems_path, notice: "Rem was successfully updated." }
        format.json { render :show, status: :ok, location: @rem }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rems/1 or /rems/1.json
  def destroy
    @rem.destroy
    respond_to do |format|
      format.html { redirect_to rems_url, notice: "Rem was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_rem
    @rem = Rem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def rem_params
    params.require(:rem).permit(:content, :user_id, :entry_id)
  end
end
