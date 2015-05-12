class Question < ActiveRecord::Base
  has_many(:responses)
  belongs_to(:survey)
  validates(:name, {:presence => true})

end
