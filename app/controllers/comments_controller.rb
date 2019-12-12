##
# Esta Classe controla o funcionamento dos comentarios em um processo de atendimento na aplicacao web.

class CommentsController < ApplicationController

  ##
  # Criar um comentario relacionado ao processo de atendimento em sua página de mais detalhes.
  #

  def create
    @attendance = Attendance.find(params[:attendance_id])
    @comment = @attendance.comments.create(params[:comment].permit(:content))
    redirect_to attendance_path(@attendance)
  end

  ##
  # Deleta um comentario relacionado ao processo de atencimento em sua página de mais detalhes.
  #

  def destroy
    @attendance = Attendance.find(params[:attendance_id])
    @comment = @attendance.comments.find(params[:id])
    @comment.destroy
    redirect_to attendance_path(@attendance)
  end
end
