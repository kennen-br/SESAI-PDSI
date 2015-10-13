class UserType < ActiveRecord::Base
  auditable

  has_many  :users

  validates :name,  length: { maximum: 255 }, presence: true, uniqueness: true

  def menu_name
    case name
    when 'Administrador'
      'admin'
    when /DSEI/
      'dsei'
    when /SESAI Central/
      'sesai_central'
    end
  end
end
