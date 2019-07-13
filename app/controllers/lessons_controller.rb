class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course
  
  def show

  end

  def require_authorized_for_current_course
    unless current_user.enrolled_in?(current_lesson.section.course)
      flash[:alert] = 'Unauthorized, you need to register first.'
      redirect_to course_path(current_lesson.section.course) 
    end
  end
  private 

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
