class GradesController < ApplicationController
  before_action :set_grade, only: [ :show, :edit, :update, :destroy ]
  skip_before_action :verify_authenticity_token
  before_action :require_token, only: [:create]

  swagger_controller :grades, 'Grades'

  swagger_api :index do
    summary 'Returns all grades'
    notes 'Notes...'
  end

  # GET /grades or /grades.json
  swagger_api :show do
    summary 'Returns one grade'
    param :path, :student_id, :integer, :required, "Student id in database"
    param :path, :id, :integer, :required, "Grade id"
    notes 'Notes...'
  end
  def index
    @grades = Grade.all
  end



  swagger_api :show do
    summary 'Returns grade from exact subject'
    param :path, :subject_id, :integer, :required, "Subject id in database"
    notes 'Notes...'
  end
  # GET /grades/1 or /grades/1.json
  def show
  end

  # GET /grades/new
  swagger_api :create do
    summary "Create a grade"
    param :path, :student_id, :integer, :required, "Student id in database"
    param :path, :subject_id, :integer, :required, "Subject id in database"
    param :form, "grade[Date]", :string, :required, "Grades date"
    param :form, "grade[Grade]", :string, :required, "Grades grade"
    param :form, "grade[GradeId]", :integer, :required, "Grades id"
  end

  def new
    @student = Student.find(params[:student_id])
    @subject = Subject.find(params[:student_id])
  end

  # GET /grades/1/edit
  def edit
  end

  # POST /grades or /grades.json
  def create
    @student = Student.find(params[:student_id])
    @subject = Subject.find(params[:subject_id])

    @gradeForStudent=@student.grades.new(grade_params)
    @gradeForSubject=@subject.grades.new(grade_params)

    respond_to do |format|
      if @gradeForStudent.save
        format.html { redirect_to [@student,@gradeForStudent], notice: "Grade was successfully created in student" }
        format.html { redirect_to [@subject,@gradeForSubject], notice: "Grade was successfully created in subject" }
        format.json { render :show, status: :created}
      else
        format.html { render :new }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grades/1 or /grades/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to [@student, @grade], notice: "Grade was successfully updated for student" }
        format.html { redirect_to [@subject, @grade], notice: "Grade was successfully updated for subject" }
        format.json { render :show, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1 or /grades/1.json
  def destroy
    @grade.destroy

    respond_to do |format|
      format.html { redirect_to grades_url, notice: "Grade was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @student = Student.find(params[:student_id])
      @subject = Subject.find(params[:student_id])
      @grade = Grade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grade_params
      params.require(:grade).permit(:GradeId, :Grade, :Date, :student_id, :subject_id)
    end
end
