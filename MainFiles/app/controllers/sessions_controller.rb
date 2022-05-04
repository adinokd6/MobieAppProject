class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
  end

  def create
      respond_to do |format|
        student = Student.find_by(StudentId: params[:session][:StudentId])
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
