class WikiEntry < ApplicationRecord
    #Cria a classe de WikiEntry que são os processos de atendimento.
    #Cada processo pode ter vários comentários, precisa ter um título único e precisa ter um conteúdo. Cada processo também pode ter um documento anexado a ele
    has_one_attached :document
    has_many :comments, class_name:"WikiComment"
    validates :title, presence: true, uniqueness: true
    validates :content, presence: true
    #validates :document, blob: {content_type: ["application/pdf", "text/html", "application/xml", "image/apng", "image/png", "image/jpeg", "text/plain", "text/xml", "text/csv" ]}
    
    validate :correct_document_mime_type

    VALID_DOCUMENT_TYPES = ["application/pdf", "text/html", "application/xml", "image/apng", "image/png", "image/jpeg", "text/plain", "text/xml", "text/csv" ]
   
    private

    def correct_document_mime_type
        #Método que verifica se o formato do documento é válido para a solicitação e retorna uma mensagem de erro caso não seja
        if document.attached? && !document.content_type.in?(VALID_DOCUMENT_TYPES)
        errors.add(:document, "#{document.content_type} não é válido")
        end
    end
end
