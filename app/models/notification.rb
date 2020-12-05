##
 # Model da classe Notification.
 # Exige que o conteúdo do corpo da notificação seja único.
 # Exige que a notificação tenha título e corpo.
class Notification < ApplicationRecord
	validates :title, presence: true
	validates :content, uniqueness: true, presence: true
end
