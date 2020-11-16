class WikiComment < ApplicationRecord
    belongs_to :entry, class_name: "WikiEntry", foreign_key: "wiki_entry_id"
    validates :content, presence: true
end
