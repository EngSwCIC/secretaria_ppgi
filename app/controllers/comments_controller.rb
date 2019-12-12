##
# Esta Classe controla o funcionamento dos comentarios na aplicacao web.

class CommentsController < ApplicationController

  ##
  # Criar um comentario a respeito do elemento apresentado na pagina.
  #

  def create
    @attendance = Attendance.find(params[:attendance_id])
    @comment = @attendance.comments.create(params[:comment].permit(:content))
    redirect_to attendance_path(@attendance)
  end

  ##
  # Deleta um comentario a respeito do elemento apresentado na pagina.
  #

  def destroy
    @attendance = Attendance.find(params[:attendance_id])
    @comment = @attendance.comments.find(params[:id])
    @comment.destroy
    redirect_to attendance_path(@attendance)
  end
end
