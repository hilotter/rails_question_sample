class Answer < ActiveRecord::Base
  belongs_to :question

  validates :answer_text, :presence => true
end
