class ClassRoomsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_class_room, only: [ :show, :edit, :update, :destroy ]

  swagger_controller :class_rooms, 'Grades'

  # GET /class_rooms or /class_rooms.json
  swagger_api :index do
    summary 'Returns all classrooms'
    notes 'Notes...'
  end
  def index
    @class_rooms = ClassRoom.all
  end

  # GET /class_rooms/1 or /class_rooms/1.json
  swagger_api :show do
    summary 'Returns one class room'
    param :path, :id, :integer, :required, "Class room id"
    notes 'Notes...'
  end
  def show
  end

  # GET /class_rooms/new
  swagger_api :create do
    summary "Create a class room"
    param :form, "class_room[Capacity]", :text, :required, "Class room capacity"
    param :form, "class_room[ClassRoomId]", :integer, :required, "Class room id"
    param :form, "class_room[Facilities]", :string, :required, "Class room Facilities"
    param :form, "class_room[RoomNumber]", :integer, :required, "Class room number"
    param :form, "class_room[RoomType]", :string, :required, "Class room type"
  end
  def new
    @class_room = ClassRoom.new
  end

  # GET /class_rooms/1/edit
  def edit
  end

  # POST /class_rooms or /class_rooms.json
  def create
    @class_room = ClassRoom.new(class_room_params)

    respond_to do |format|
      if @class_room.save
        format.html { redirect_to class_room_url(@class_room), notice: "Class room was successfully created." }
        format.json { render :show, status: :created, location: @class_room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @class_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_rooms/1 or /class_rooms/1.json
  def update
    respond_to do |format|
      if @class_room.update(class_room_params)
        format.html { redirect_to class_room_url(@class_room), notice: "Class room was successfully updated." }
        format.json { render :show, status: :ok, location: @class_room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @class_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_rooms/1 or /class_rooms/1.json
  def destroy
    @class_room.destroy

    respond_to do |format|
      format.html { redirect_to class_rooms_url, notice: "Class room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_room
      @class_room = ClassRoom.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def class_room_params
      params.require(:class_room).permit(:ClassRoomId, :RoomNumber, :Capacity, :RoomType, :Facilities)
    end
end
