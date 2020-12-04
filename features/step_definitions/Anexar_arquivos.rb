Dado('que sou usuario') do
  if user_signed_in?

Dado('estou registrado') do
  if user_signed_in?

Quando('eu clicar para anexar arquivos validos a um novo processo') do
  user = current_user
      permitted_params = params.require(:processo).permit(:sei_process_code, :process_status_id, :document_files => [])
      process = user.processos.create({"sei_process_code": permitted_params["sei_process_code"], "process_status_id": permitted_params["process_status_id"]})
      process.save
      permitted_params["document_files"].each do |doc|
        doc_model = {"processo_id": process[:id], "data" => doc.read, "filename": doc.original_filename, "mime_type": doc.content_type}
        process.documents.create(doc_model)

end

Entao('devo receber como retorno mensagem de sucesso') do
  reload_processes(user)
  redirect_to process_home_path

end

Quando('eu clicar para anexar arquivos invalidos a um novo processo') do
  user = current_user
      permitted_params = params.require(:processo).permit(:sei_process_code, :process_status_id, :document_files => [])
      process = user.processos.create({"sei_process_code": permitted_params["sei_process_code"], "process_status_id": permitted_params["process_status_id"]})
      process.save
      permitted_params["document_files"].each do |doc|
        doc_model = {"processo_id": process[:id], "data" => doc.read, "filename": doc.original_filename, "mime_type": doc.content_type}
        process.documents.create(doc_model)

end

Entao('devo receber como retorno mensagem de falha') do
	reload_processes(user)
    redirect_to process_home_path

end
  
Dado('nao estou registrado') do
  else

Entao('devo ser encaminhado para a pagina inicial') do
  redirect_to home_path
end