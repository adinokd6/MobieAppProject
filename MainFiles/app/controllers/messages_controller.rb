class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_message, only: [ :show, :edit, :update, :destroy ]

swagger_controller :certificates, 'Messages'

  # GET /messages or /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1 or /messages/1.json
  def show
  end
  swagger_api :show do
    summary 'Returns one message'
    param :path, :email_id, :integer, :required, "Email id"
    param :path, :id, :integer, :required, "Message id"
    notes 'Notes...'
  end

  # GET /messages/new
  def new
    @email = Email.find(params[:email_id])
    @message=@email.messages.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    @sender = Email.find(params[:email_id])
    @receiver = Email.where(EmailAddress: message_params[:To]).first

    @message1=@receiver.messages.new(message_params)
    @message2=@sender.messages.new(message_params)

    @message1.email=@receiver
    @message2.email=@sender

    respond_to do |format|
      if @message1.save
        @message2.save
        format.html { redirect_to [@sender,@message], notice: "Message was successfully created." }
        format.json { render :show, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  swagger_api :create do
    summary "Create new message"
    param :form, "message[From]", :integer, :required, "From"
    param :form, "message[To]", :text, :required, "To"
    param :form, "message[Title]", :integer, :required, "Title"
    param :form, "message[Text]", :string, "Text"
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to [@email,@message], notice: "Message was successfully updated." }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  swagger_api :update do
    summary "Update message information"
    param :path, :email_id, :integer, :required, "Email id"
    param :form, "message[From]", :integer, :required, "From"
    param :form, "message[To]", :text, :required, "To"
    param :form, "message[Title]", :integer, :required, "Title"
    param :form, "message[Text]", :string, "Text"
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @email = Email.find(params[:email_id])
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:MessageId, :From, :To, :Text, :Date)
    end
end
