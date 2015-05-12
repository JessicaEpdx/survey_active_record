class Question < ActiveRecord::Base
  validates(:name, {:presence => true})
  has_many(:responses)
  belongs_to(:survey)
end
