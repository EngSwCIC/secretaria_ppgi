class CommentsController < ApplicationController
  def create
    @attendance = Attendance.find(params[:attendance_id])
    @comment = @attendance.comments.create(params[:comment].permit(:content))
    redirect_to attendance_path(@attendance)
  end

  def destroy
    @attendance = Attendance.find(params[:attendance_id])
    @comment = @attendance.comments.find(params[:id])
    @comment.destroy
    redirect_to attendance_path(@attendance)
  end
end
