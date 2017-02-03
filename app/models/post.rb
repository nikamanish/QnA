class Post < ApplicationRecord

	belongs_to :membership, dependent: :destroy
	has_many :comments, dependent: :destroy
end