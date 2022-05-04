class SubjectsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_subject, only: [ :show, :edit, :update, :destroy ]

  swagger_controller :subjects, 'Subjects'

  # GET /subjects or /subjects.json
  swagger_api :index do
    summary 'Returns all subjects'
    notes 'Notes...'
  end
  def index
    @subjects = Subject.all
  end

  # GET /subjects/1 or /subjects/1.json
  swagger_api :show do
    summary 'Returns one subject with exact id'
    param :path, :id, :integer, :required, "Subject id"
    notes 'Notes...'
  end

  def show
  end

  def new
    @subject = Subject.new
  end
  # GET /subjects/new
  swagger_api :create do
    summary "Create a subject"
    param :form, "subject[teacher_id]", :integer, "Teacher id in database"
    param :form, "subject[trainer_id]", :integer, "Trainer id in database"
    param :form, "subject[Description]", :text, :required, "Subject description"
    param :form, "subject[MaxCapacity]", :integer, :required, "Subject max capacity"
    param :form, "subject[SubjectId]", :integer, :required, "Subject id"
  end


  # POST /subjects or /subjects.json
  def create
    @subject =Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: "Subject was successfully created." }
        format.json { render :show, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end


  # GET /subjects/1/edit
  def edit
  end

  swagger_api :update do
    summary "Update subject information"
    param :form, "subject[teacher_id]", :integer, :required, "Teacher id in database"
    param :form, "subject[trainer_id]", :integer, :required, "Trainer id in database"
    param :form, "subject[Description]", :text, :required, "Subject description"
    param :form, "subject[MaxCapacity]", :integer, :required, "Subject max capacity"
    param :form, "subject[SubjectId]", :integer, :required, "Subject id"
  end
  # PATCH/PUT /subjects/1 or /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to @subject, notice: "Subject was successfully updated." }
        format.json { render :show, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1 or /subjects/1.json

  swagger_api :destroy do
    summary 'Delete subject'
    param :path, :id, :integer, :required, "Subject id"
    notes 'Notes...'
  end

  def destroy
    @subject.destroy

    respond_to do |format|
      format.html { redirect_to @subject, notice: "Subject was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subject_params
      params.require(:subject).permit(:SubjectId, :Description, :MaxCapacity, :trainer_id, :teacher_id)
    end
end
