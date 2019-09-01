# frozen_string_literal: true

module QuestionsHelper
  def form_title
    @question.new_record? ? 'Ask a question' : 'Edit question'
  end

  def form_submit
    @question.new_record? ? 'Submit question' : 'Update question'
  end
end
