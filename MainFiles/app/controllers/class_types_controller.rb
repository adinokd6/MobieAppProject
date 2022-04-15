class ClassTypesController < ApplicationController
  before_action :set_class_type, only: %i[ show edit update destroy ]

  # GET /class_types or /class_types.json
  def index
    @class_types = ClassType.all
  end

  # GET /class_types/1 or /class_types/1.json
  def show
  end

  # GET /class_types/new
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

    # Only allow a list of trusted parameters through.
    def class_type_params
      params.require(:class_type).permit(:ClassId, :Period, :Time, :animal_id)
    end
end
