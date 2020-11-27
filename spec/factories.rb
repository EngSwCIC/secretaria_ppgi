FactoryBot.define do 
    factory :comment, class: WikiComment do 
        content {"Processo deferido"}
        entry
        to_create do |instance|
            instance.attributes = WikiComment.find_or_create_by(content: instance.content, entry: instance.entry).attributes
            instance.reload
        end
    end
    factory :entry, class: WikiEntry do 
        title {"Processo de matricula"}
        content {"Aluno se matricula"}
        to_create do |instance|
            instance.attributes = WikiEntry.find_or_create_by(title: instance.title, content: instance.content).attributes
            instance.reload
        end
    end
end