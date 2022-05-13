class ClassRoomsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_class_room, only: [ :show, :edit, :update, :destroy ]

  swagger_controller :class_rooms, 'Class rooms'

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
    param :path, :class_type_id, :integer, :required, "Class id"
    notes 'Notes...'
  end
  def show
  end

  # GET /class_rooms/new
  swagger_api :create do
    summary "Create a class room"
    param :path, :class_type_id, :integer, :required, "Class id"
    param :form, "class_room[Capacity]", :text, :required, "Class room capacity"
    param :form, "class_room[ClassRoomId]", :integer, :required, "Class room id"
    param :form, "class_room[Facilities]", :string, :required, "Class room Facilities"
    param :form, "class_room[RoomNumber]", :integer, :required, "Class room number"
    param :form, "class_room[RoomType]", :string, :required, "Class room type"
  end
  def new
    @class_type = ClassType.find(params[:class_type_id])
  end

  # GET /class_rooms/1/edit
  def edit
  end

  # POST /class_rooms or /class_rooms.json
  def create
    @class_type = ClassType.find(params[:class_type_id])
    @class_room=@class_type.create_class_room(class_room_params)

    respond_to do |format|
      if @class_room.save
        format.html { redirect_to [@class_type, @class_room], notice: "Class room was successfully created." }
        format.json { render :show, status: :created}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @class_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_rooms/1 or /class_rooms/1.json
  swagger_api :update do
    summary "Update class room information"
    param :path, :id, :integer, :required, "Classroom id"
    param :path, :class_type_id, :integer, :required, "Class id"
    param :form, "class_room[Capacity]", :text, "Class room capacity"
    param :form, "class_room[ClassRoomId]", :integer, "Class room id"
    param :form, "class_room[Facilities]", :string, "Class room Facilities"
    param :form, "class_room[RoomNumber]", :integer, "Class room number"
    param :form, "class_room[RoomType]", :string, "Class room type"
  end

  def update
    respond_to do |format|
      if @class_room.update(class_room_params)
        format.html { redirect_to [@class_type, @class_room], notice: "Class room was successfully updated." }
        format.json { render :show, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @class_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_rooms/1 or /class_rooms/1.json
  swagger_api :destroy do
    summary 'Delete class room from database'
    param :path, :class_type_id, :integer, :required, "Class in database"
    param :path, :id, :integer, :required, "Class room id in database"
    notes 'Notes...'
  end

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
      @class_type = ClassType.find(params[:class_type_id])
      @class_room = ClassRoom.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def class_room_params
      params.require(:class_room).permit(:ClassRoomId, :RoomNumber, :Capacity, :RoomType, :Facilities, :class_type_id)
    end
end
