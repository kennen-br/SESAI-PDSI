class BudgetJustifier < ActiveRecord::Base
  belongs_to :budget_investments
  belongs_to :budget_forecasts
  belongs_to :user
  has_attached_file :file
  validates_attachment_content_type :file,
                                    content_type: ['application/pdf',
                                                   'application/vnd.ms-excel',
                                                   'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
                                                   'application/msword',
                                                   'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
                                                   'text/plain',
                                                   'image/jpeg',
                                                   'image/png',
                                                   'image/gif',
                                                   'application/pdf']
end
