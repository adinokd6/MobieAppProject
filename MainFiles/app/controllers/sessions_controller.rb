class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
swagger_controller :session, "Authentication"

  def new
  end

  swagger_api :create do
    summary "Gather a token"
    param :form, "session[index]", :string, :required, "Chosen user index"
    param :form, "session[password]", :string, :required, "Chosen user password"
  end

  def create
      respond_to do |format|
        student = Student.find_by(StudentId: params[:session][:StudentId])
        teacher = Teacher.find_by(TeacherId: params[:session][:TeacherId])
        trainer = Trainer.find_by(TrainerId: params[:session][:TrainerId])
        if student && student.authenticate(params[:session][:password])
          format.html do
            log_in student
            redirect_to student
          end
          format.json do
            student.password = params[:session][:password]
            student.regenerate_token
            render json: { token: student.token }
          end
        elsif teacher && teacher.authenticate(params[:session][:password])
          format.html do
            log_in_teacher teacher
            redirect_to teacher
          end
          format.json do
            teacher.password = params[:session][:password]
            teacher.regenerate_token
            render json: { token: teacher.token }
          end
        elsif trainer && trainer.authenticate(params[:session][:password])
          format.html do
            log_in_trainer trainer
            redirect_to trainer
          end
          format.json do
            trainer.password = params[:session][:password]
            trainer.regenerate_token
            render json: { token: teacher.token }
          end
        else
          format.html do
            render 'new'
          end
          format.json do
            render json: { message: 'Niepoprawne dane' }
          end
        end
      end
   end

  def destroy
    log_out
    redirect_to root_url
  end
end
