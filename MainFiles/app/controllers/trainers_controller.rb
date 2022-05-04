class TrainersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_trainer, only: [ :show, :edit, :update, :destroy ]

  swagger_controller :trainers, 'Trainers'

  # GET /trainers or /trainers.json
  swagger_api :index do
    summary 'Returns all trainers'
    notes 'Notes...'
  end
  def index
    @trainers = Trainer.all
  end

  # GET /trainers/1 or /trainers/1.json
  swagger_api :show do
    summary 'Returns one trainer with exact id'
    param :path, :id, :integer, :required, "Trainer id"
    notes 'Notes...'
  end
  def show
  end

  # GET /trainers/new
  swagger_api :create do
    summary "Create a trainer"
    param :path, :employee_id, :integer, :required, "Employee in database"
    param :form, "trainer[FristName]", :string, :required, "Trainer first name"
    param :form, "trainer[SecondName]", :string, :required, "Trainer second name"
    param :form, "trainer[TrainerId]", :integer, :required, "Trainer id"
  end
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
  swagger_api :update do
    summary "Update trainer information"
    param :path, :employee_id, :integer, :required, "Employee in database"
    param :form, "trainer[FristName]", :string, :required, "Trainer first name"
    param :form, "trainer[SecondName]", :string, :required, "Trainer second name"
    param :form, "trainer[TrainerId]", :integer, :required, "Trainer id"
  end

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
  swagger_api :destroy do
    summary 'Delete trainer from database'
    param :path, :id, :integer, :required, "Trainer id"
    notes 'Notes...'
  end

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
