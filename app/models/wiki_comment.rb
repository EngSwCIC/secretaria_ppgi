##
#Classe que cria os comentários pertencentes aos processos de Atendimento. Eles tem necessariamente que estar ligados à id de um WikiEntry e precisam ter um conteúdo
class WikiComment < ApplicationRecord
    belongs_to :entry, class_name: "WikiEntry", foreign_key: "wiki_entry_id"
    validates :content, presence: true
end
