class Group < ApplicationRecord

	validates :name, presence: true, length: { minimum: 6 }, uniqueness: { case_sensitive: false }

end
