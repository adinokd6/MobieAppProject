class CertificatesController < ApplicationController
  before_action :set_certificate, only: [ :show, :edit, :update, :destroy ]
  skip_before_action :verify_authenticity_token
  before_action :require_token, only: [:create]


  swagger_controller :certificates, 'Certificates'

  # GET /certificates/1 or /certificates/1.json
  swagger_api :show do
    summary 'Returns one certificate'
    param :path, :student_id, :integer, :required, "Student id"
    param :path, :id, :integer, :required, "Certificate id"
    notes 'Notes...'
  end
  def show
  end

  def index
    @certificates = Certificate.all
  end

  def new
    @student = Student.find(params[:student_id])
  end
  # GET /certificates/new
  swagger_api :create do
    summary "Create new certificate for student"
    param :header, "Authorization", :string, :required, "Authentication token"
    param :path, :student_id, :integer, :required, "Student id"
    param :form, "certificate[CertificateId]", :integer, :required, "Certificate id"
    param :form, "certificate[Description]", :text, :required, "Certificate description"
    param :form, "certificate[Grade]", :integer, :required, "Certificate grade"
    param :form, "certificate[Name]", :string, :required, "Certificate name"
  end


  # GET /certificates/1/edit
  def edit
  end

  # POST /certificates or /certificates.json
  def create
    @student = Student.find(params[:student_id])
    @certificate=@student.certificates.new(certificate_params)

    respond_to do |format|
      if @certificate.save
        format.html { redirect_to [@student, @certificate], notice: "Certificate was successfully created." }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /certificates/1 or /certificates/1.json
  def update
    respond_to do |format|
      if @certificate.update(certificate_params)
        format.html { redirect_to [@student,@certificate], notice: "Certificate was successfully updated." }
        format.json { render :show, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /certificates/1 or /certificates/1.json
  def destroy
    @certificate.destroy

    respond_to do |format|
      format.html { redirect_to certificates_url, notice: "Certificate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_certificate
      @student = Student.find(params[:student_id])
      @certificate = Certificate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def certificate_params
      params.require(:certificate).permit(:CertificateId, :Name, :Grade, :Description, :student_id)
    end
end
