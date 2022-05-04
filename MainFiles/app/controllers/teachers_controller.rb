class TeachersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_teacher, only: [ :show, :edit, :update, :destroy, :addsubject, :removesubject ]

  swagger_controller :teachers, 'Teachers'


  swagger_api :addsubject do
    summary 'Remove subject owner'
    notes 'Notes...'
    param :path, :employee_id, :integer, :required, "Employee in database"
    param :path, :id, :integer, :required, "Teacher id in database"
    param :path, :subject_id, :integer, :required, "Subject id in database"
  end

  def addsubject
    @subject=Subject.find(params[:subject_id])
    unless @teacher.has_subject?(@subject)
      @teacher.subjects.append(@subject)
    end
    redirect_to @subject
  end



  swagger_api :removesubject do
    summary 'Remove subject owner'
    notes 'Notes...'
    param :path, :employee_id, :integer, :required, "Employee in database"
    param :path, :id, :integer, :required, "Teacher id in database"
    param :form, :subject_id, :integer, :required, "Subject id in database"
  end

  def removesubject
    if @teacher.has_subject?(@subject)
      @teacher.subjects.delete(@teacher)
    end
  end

  # GET /teachers or /teachers.json
  swagger_api :index do
    summary 'Returns all teachers'
    notes 'Notes...'
  end
  def index
    @teachers = Teacher.all
  end

  # GET /teachers/1 or /teachers/1.json
  swagger_api :show do
    summary 'Returns one teacher'
    param :path, :id, :integer, :required, "Teacher id"
    param :path, :employee_id, :integer, :required, "Employee in database"
    notes 'Notes...'
  end
  def show
  end

  # GET /teachers/new
  swagger_api :create do
    summary "Create a teacher"
    param :path, :employee_id, :integer, :required, "Employee in database"
    param :form, "teacher[FirstName]", :string, :required, "Teacher first name"
    param :form, "teacher[LastName]", :string, "Teacher last name"
    param :form, "teacher[Title]", :string, "Teacher title"
    param :form, "teacher[TeacherId]", :integer, "Teacher id"
  end
  def new
    @employee = Employee.find(params[:employee_id])
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers or /teachers.json
  def create
    @employee = Employee.find(params[:employee_id])
    @teacher=@employee.create_teacher(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to [@employee, @teacher], notice: "Teacher was successfully created." }
        format.json { render :show, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1 or /teachers/1.json
  swagger_api :update do
    summary "Update teacher information"
    param :path, :employee_id, :integer, :required, "Employee in database"
    param :path, :id, :integer, :required, "Teacher id in database"
    param :form, "teacher[FirstName]", :string, :required, "Teacher first name"
    param :form, "teacher[LastName]", :string, "Teacher last name"
    param :form, "teacher[Title]", :string, "Teacher title"
    param :form, "teacher[TeacherId]", :integer, "Teacher id"
  end

  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to [@employee, @teacher], notice: "Teacher was successfully updated." }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1 or /teachers/1.json
  swagger_api :destroy do
    summary 'Delete teacher from database'
    param :path, :employee_id, :integer, :required, "Employee in database"
    param :path, :id, :integer, :required, "Teacher id in database"
    notes 'Notes...'
  end

  def destroy
    @teacher.destroy

    respond_to do |format|
      format.html { redirect_to teachers_url, notice: "Teacher was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @employee = Employee.find(params[:employee_id])
      @teacher = Teacher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teacher_params
      params.require(:teacher).permit(:TeacherId, :FirstName, :LastName, :Title, :employee_id)
    end
end
