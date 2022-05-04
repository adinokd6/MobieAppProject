class ClassTypesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_class_type, only: [ :show, :edit, :update, :destroy ]

  before_action :set_class_and_subject, only: [:addsubject, :removesubject]

  swagger_controller :class_types, 'Classes'

  #methods for adding and removing subject from classes
  swagger_api :addsubject do
    summary 'Add subject for a class'
    notes 'Notes...'
    param :path, :id, :integer, :required, "Class type id"
    param :form, :subject_id, :integer, :required, "Subject id in database"
  end



  def addsubject
    unless @class_type.follows?(@subject)
      @class_type.subjects.append(@subject)
      @subject.class_types.append(@class_type)
    end
    redirect_to @subject
  end



  swagger_api :removesubject do
    summary 'Remove subject from course'
    notes 'Notes...'
    param :path, :id, :integer, :required, "Class type id"
    param :path, :subject_id, :integer, :required, "Subject id in database"
  end

  def removesubject
    if @class_type.follows?(@subject)
      @subject.class_types.delete(@class_type)
    end
    redirect_to @subject
  end


  # GET /class_types or /class_types.json
  swagger_api :index do
    summary 'Returns all classes'
    notes 'Notes...'
  end
  def index
    @class_types = ClassType.all
  end

  # GET /class_types/1 or /class_types/1.json
  swagger_api :show do
    summary 'Returns one class'
    param :path, :id, :integer, :required, "Class id"
    notes 'Notes...'
  end
  def show
  end

  # GET /class_types/new
  swagger_api :create do
    summary "Create a class"
    param :form, "class_type[ClassId]", :integer, :required, "Class id"
    param :form, "class_type[Period]", :string, "Class period"
    param :form, "class_type[Time]", :string, "Class time"
  end
  def new
    @class_type = ClassType.new
  end

  # GET /class_types/1/edit
  def edit
  end

  # POST /class_types or /class_types.json
  def create
    @class_type = ClassType.new(class_type_params)

    respond_to do |format|
      if @class_type.save
        format.html { redirect_to class_type_url(@class_type), notice: "Class type was successfully created." }
        format.json { render :show, status: :created, location: @class_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @class_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_types/1 or /class_types/1.json
  def update
    respond_to do |format|
      if @class_type.update(class_type_params)
        format.html { redirect_to class_type_url(@class_type), notice: "Class type was successfully updated." }
        format.json { render :show, status: :ok, location: @class_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @class_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_types/1 or /class_types/1.json
  def destroy
    @class_type.destroy

    respond_to do |format|
      format.html { redirect_to class_types_url, notice: "Class type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_type
      @class_type = ClassType.find(params[:id])
    end

    def set_class_and_subject
      @class_type = ClassType.find(params[:id])
      @subject=Subject.find(params[:subject_id])
    end



    # Only allow a list of trusted parameters through.
    def class_type_params
      params.require(:class_type).permit(:ClassId, :Period, :Time, :animal_id)
    end
end
