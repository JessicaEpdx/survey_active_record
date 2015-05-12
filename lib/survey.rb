class Survey < ActiveRecord::Base
  has_many(:questions)
  validates(:title, {:presence => true, :length => {:maximum => 50}})
  before_save(:titlecase_title)

  private

  define_method(:titlecase_title) do
    self.title=(title().titlecase())
  end
end
