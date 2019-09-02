# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  title      :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, :dependent => :delete_all

  validates :title, :content, presence: true
  validates :content, length: { minimum: 200 }
end
