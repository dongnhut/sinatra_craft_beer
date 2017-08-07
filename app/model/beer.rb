class Beer < ApplicationRecord

  belongs_to :category
  has_many :customers

end
