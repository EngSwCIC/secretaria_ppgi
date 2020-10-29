def valid(file)
    accepted_formats = [".txt", ".pdf", ".png", ".jpg"]
    accepted_formats.include? File.extname(file)
end

Dado("um processo existente") do
    @processo = {'id' => 1, 'files' => []}
end

Quando("adiciono um arquivo {string} ao processo") do |file|
    if valid file
        @processo['files'].append(file)
    end
end

Então("o processo deve constar com o novo arquivo {string}") do |file|
  expect(@processo['files']).to include('file.pdf')
end

Então("o processo não deve constar o novo arquivo {string}") do |file|
  expect(@processo['files']).not_to include('file.exe')
end