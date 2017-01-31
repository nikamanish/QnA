class Group < ApplicationRecord

	validates :name, presence: true, length: { minimum: 6 }, uniqueness: { case_sensitive: false }

	has_many :memberships, dependent: :destroy
	has_many :users, :through => :memberships
	has_many :invitations, dependent: :destroy

end
