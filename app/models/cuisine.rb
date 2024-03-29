# == Schema Information
#
# Table name: cuisines
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_cuisines_on_name  (name) UNIQUE
#
class Cuisine < ApplicationRecord
  validates :name, presence: :true 
end
