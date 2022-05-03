class GradesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_grade, only: [ :show, :edit, :update, :destroy ]

  swagger_controller :grades, 'Grades'

  # GET /grades or /grades.json
  #Need to implement method which return all grades for exact subject

  # GET /grades/1 or /grades/1.json
  def show
  end

  def new
    @subject = Subject.find(params[:subject_id])
    @grade=@subject.grades.new
  end

  # GET /grades/new
  swagger_api :create do
    summary "Create a grade"
    param :path, :subject_id, :integer, :required, "Subject id in database"
    param :form, "grade[student_id]", :integer, :required, "Student id in database"
    param :form, "grade[Date]", :string, :required, "Grades date"
    param :form, "grade[Grade]", :string, :required, "Grades grade"
    param :form, "grade[GradeId]", :integer, :required, "Grades id"
  end

  def create
    @subject = Subject.find(params[:subject_id])

    @grade=@subject.grades.new(grade_params)

    respond_to do |format|
      if @grade.save
        format.html { redirect_to [@subject,@grade], notice: "Grade was successfully created in subject" }
        format.json { render :show, status: :created}
      else
        format.html { render :new }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end



  # GET /grades/1/edit
  def edit
  end

  swagger_api :update do
    summary "Create a grade"
    param :path, :subject_id, :integer, :required, "Subject id in database"
    param :path, :id, :integer, :required, "Grade id in database"
    param :form, "grade[Date]", :string, :required, "Grades date"
    param :form, "grade[Grade]", :string, :required, "Grades grade"
  end


  # PATCH/PUT /grades/1 or /grades/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to [@subject,@grade], notice: "Grade was successfully updated for subject" }
        format.json { render :show, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /grades/1 or /grades/1.json
  swagger_api :destroy do
    summary 'Destroys grade'
    param :path, :subject_id, :integer, :required, "Subject id in database"
    param :path, :id, :integer, :required, "Grade id"
    notes 'Notes...'
  end

  def destroy
    @grade.destroy

    respond_to do |format|
      format.html { redirect_to [@subject,@grade], notice: "Grade was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @subject = Subject.find(params[:subject_id])
      @grade = Grade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grade_params
      params.require(:grade).permit(:GradeId, :Grade, :Date, :student_id, :subject_id)
    end
end
