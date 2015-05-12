class Response < ActiveRecord::Base
  belongs_to(:question)
  validates(:input, {:presence => true})
end
