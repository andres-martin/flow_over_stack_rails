# frozen_string_literal: true

module QuestionsHelper
  def form_title
    @question.new_record? ? 'Ask a question' : 'Edit question'
  end

  def form_submit
    @question.new_record? ? 'Submit question' : 'Update question'
  end

  def markdownify(content)
    pipeline_context = {gfm: true}
    pipeline = HTML::Pipeline.new [
      HTML::Pipeline::MarkdownFilter,
      HTML::Pipeline::SanitizationFilter,
    ], pipeline_context
    pipeline.call(content)[:output].to_s.html_safe
  end
end
