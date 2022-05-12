class TrainersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_trainer, only: [ :show, :edit, :update, :destroy, :addsubject, :removesubject ]

  swagger_controller :trainers, 'Trainers'

  swagger_api :addsubject do
    summary 'Remove subject owner'
    notes 'Notes...'
    param :path, :id, :integer, :required, "Trainer id in database"
    param :path, :subject_id, :integer, :required, "Subject id in database"
  end

  def addsubject
    @subject=Subject.find(params[:subject_id])
    unless @trainer.has_subject?(@subject)
      @trainer.subjects.append(@subject)
    end
    redirect_to @subject
  end



  swagger_api :removesubject do
    summary 'Remove subject owner'
    notes 'Notes...'
    param :path, :id, :integer, :required, "Trainer id in database"
    param :form, :subject_id, :integer, :required, "Subject id in database"
  end

  def removesubject
    if @trainer.has_subject?(@subject)
      @trainer.subjects.delete(@trainer)
    end
  end

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
    param :form, "trainer[FirstName]", :string, :required, "Trainer first name"
    param :form, "trainer[LastName]", :string, :required, "Trainer second name"
    param :form, "trainer[TrainerId]", :integer, :required, "Trainer id"
  end
  def new
    @employee = Employee.find(params[:employee_id])
  end

  # GET /trainers/1/edit
  def edit
  end

  # POST /trainers or /trainers.json
  def create
    @trainer=Trainer.new(trainer_params)

    respond_to do |format|
      if @trainer.save
        format.html { redirect_to [@employee, @trainer], notice: "Trainer was successfully created." }
        format.json { render :show, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trainer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainers/1 or /trainers/1.json
  swagger_api :update do
    summary "Update trainer information"
    param :path, :id, :integer, :required, "Trainer id in database"
    param :form, "trainer[FirstName]", :string, "Trainer first name"
    param :form, "trainer[LastName]", :string, "Trainer second name"
    param :form, "trainer[TrainerId]", :integer, "Trainer id"
  end

  def update
    respond_to do |format|
      if @trainer.update(trainer_params)
        format.html { redirect_to redirect_to [@employee, @trainer], notice: "Trainer was successfully updated." }
        format.json { render :show, status: :ok }
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
