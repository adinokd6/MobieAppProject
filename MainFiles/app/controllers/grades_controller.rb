class GradesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_grade, only: %i[ show edit update destroy ]

  swagger_controller :grades, 'Grades'

  swagger_api :index do
    summary 'Returns all grades'
    notes 'Notes...'
  end

  # GET /grades or /grades.json
  swagger_api :show do
    summary 'Returns one grade'
    param :path, :id, :integer, :required, "Grade id"
    notes 'Notes...'
  end
  def index
    @grades = Grade.all
  end



  swagger_api :show do
    summary 'Returns grade from exact subject'
    param :path, :id, :integer, :required, "Subject id"
    notes 'Notes...'
  end
  # GET /grades/1 or /grades/1.json
  def show
  end

  # GET /grades/new
  swagger_api :create do
    summary "Create a grade"
    param :form, "grade[Date]", :string, :required, "Grades date"
    param :form, "grade[Grade]", :string, :required, "Grades grade"
    param :form, "grade[GradeId]", :integer, :required, "Grades id"
  end
  def new
    @grade = Grade.new
  end

  # GET /grades/1/edit
  def edit
  end

  # POST /grades or /grades.json
  def create
    @grade = Grade.new(grade_params)

    respond_to do |format|
      if @grade.save
        format.html { redirect_to grade_url(@grade), notice: "Grade was successfully created." }
        format.json { render :show, status: :created, location: @grade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grades/1 or /grades/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to grade_url(@grade), notice: "Grade was successfully updated." }
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { render :edit, status: :unprocessable_entity }
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
      @grade = Grade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grade_params
      params.require(:grade).permit(:GradeId, :Grade, :Date)
    end
end
