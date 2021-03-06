class AnimalsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_animal, only: [ :show, :edit, :update, :destroy ]

    swagger_controller :animals, 'Animals'

  # GET /animals or /animals.json
  swagger_api :index do
    summary 'Returns all animals'
    notes 'Notes...'
  end
  def index
    @animals = Animal.all
  end

  # GET /animals/1 or /animals/1.json
  swagger_api :show do
    summary 'Returns one animal'
    param :path, :id, :integer, :required, "Animal id"
    notes 'Notes...'
  end
  def show
  end

  # GET /animals/new
  def new
    @animal = Animal.new
  end

  # GET /animals/1/edit
  def edit
  end

  # POST /animals or /animals.json
  swagger_api :create do
    param :form, "animal[Name]", :string, :required, "Animal name"
    param :form, "animal[Species]", :string, :required, "Animal species"
    param :form, "animal[Gender]", :string, :required, "Animal gender"
    param :form, "animal[IsAlive]", :bool, :required, "Is alive"
  end
  def create
    @animal = Animal.new(animal_params)

    respond_to do |format|
      if @animal.save
        format.html { redirect_to @animal, notice: "Animal was successfully created." }
        format.json { render :show, status: :created, location: @animal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animals/1 or /animals/1.json
  swagger_api :update do
    param :path, :id, :integer, :required, "Animal id in database"
    param :form, "animal[Name]", :string, "Animal name"
    param :form, "animal[Species]", :string, "Animal species"
    param :form, "animal[Gender]", :string, "Animal gender"
    param :form, "animal[IsAlive]", :bool, "Is alive"
  end
  def update
    respond_to do |format|
      if @animal.update(animal_params)
        format.html { redirect_to @animal, notice: "Animal was successfully updated." }
        format.json { render :show, status: :ok, location: @animal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animals/1 or /animals/1.json
  swagger_api :destroy do
    param :path, :id, :integer, :required, "Animal id in database"  
  end
  def destroy
    @animal.destroy

    respond_to do |format|
      format.html { redirect_to animals_url, notice: "Animal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def animal_params
      params.require(:animal).permit(:AnimalId, :Species, :Gender, :IsAlive, :Name)
    end
end
