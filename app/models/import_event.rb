# == Schema Information
#
# Table name: import_events
#
#  id          :integer          not null, primary key
#  file_name   :string
#  import_type :string
#  message     :text
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class ImportEvent < ApplicationRecord
end
