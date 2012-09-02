# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  content     :integer          default(0)
#  user_id     :integer
#  question_id :integer
#  points      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  available   :integer          default(0)
#

require 'spec_helper'

describe Answer do
  pending "add some examples to (or delete) #{__FILE__}"
end
