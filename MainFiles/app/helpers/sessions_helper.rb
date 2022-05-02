module SessionsHelper
  def log_in(student)
    session[:student_id] = student.id
  end

  def current_student
    @current_student ||= Student.find_by(id: session[:student_id])
  end

  def logged_in?
    !current_student.nil?
  end

  def log_out
    session.delete(:student_id)
    @current_student = nil
  end

  def require_token
    respond_to do |format|
      format.json {
        authenticate_token || render_unauthorized("Access denied")
      }
      format.html { }
    end
  end

  def render_unauthorized(message)
    errors = { errors: [ { detail: message } ] }
    render json: errors, status: :unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      @current_student ||= Student.find_by(token: token)
  end
end
end
