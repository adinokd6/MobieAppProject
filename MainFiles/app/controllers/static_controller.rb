class StaticController < ApplicationController
  def index
    @students = Student.all
  end
end
