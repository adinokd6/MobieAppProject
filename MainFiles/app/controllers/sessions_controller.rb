class SessionsController < ApplicationController
  def new
  end

  def create
    student = Student.find_by(StudentId: params[:session][:StudentId])
    if student && student.authenticate(params[:session][:password])
      # Wszystko dobrze, logujemy
      log_in student
      redirect_to student
    else
      # Niedobrze
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
