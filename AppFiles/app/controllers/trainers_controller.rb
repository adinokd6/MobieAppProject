class TrainersController < ApplicationController
  before_action :set_trainer, only: %i[ show edit update destroy ]

  # GET /trainers or /trainers.json
  def index
    @trainers = Trainer.all
  end

  # GET /trainers/1 or /trainers/1.json
  def show
  end

  # GET /trainers/new
  def new
    @trainer = Trainer.new
  end

  # GET /trainers/1/edit
  def edit
  end

  # POST /trainers or /trainers.json
  def create
    @trainer = Trainer.new(trainer_params)

    respond_to do |format|
      if @trainer.save
        format.html { redirect_to trainer_url(@trainer), notice: "Trainer was successfully created." }
        format.json { render :show, status: :created, location: @trainer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trainer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainers/1 or /trainers/1.json
  def update
    respond_to do |format|
      if @trainer.update(trainer_params)
        format.html { redirect_to trainer_url(@trainer), notice: "Trainer was successfully updated." }
        format.json { render :show, status: :ok, location: @trainer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trainer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainers/1 or /trainers/1.json
  def destroy
    @trainer.destroy

    respond_to do |format|
      format.html { redirect_to trainers_url, notice: "Trainer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trainer
      @trainer = Trainer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trainer_params
      params.require(:trainer).permit(:TrainerId, :FirstName, :LastName)
    end
end
