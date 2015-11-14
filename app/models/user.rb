require "#{Rails.root}/lib/debug.rb"

class User < ActiveRecord::Base
  auditable except: [:last_sign_in_at, :current_sign_in_at, :sign_in_count]

  validates :username,  presence: true, uniqueness: true
  validates_with PasswordStrengthValidator

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :trackable, :validatable

  has_one :profile
  accepts_nested_attributes_for :profile

  has_many  :costs, through:  :cost_users

  has_many  :cost_users
  accepts_nested_attributes_for :cost_users, reject_if: lambda { |attributes| attributes['value_2015'].blank? }

  has_many  :responsability_comments, :dependent => :destroy

  belongs_to  :user_type

  has_one :pdsi

  belongs_to  :dsei

  validates :user_type, presence: true

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def admin?
    user_type.name == 'Administrador'
  end

  def sesai_central?
    !user_type.name.scan(/SESAI Central/).blank?
  end

  def dsei?
    !user_type.name.scan(/DSEI/).blank?
  end

  def pdsi
    return @pdsi unless @pdsi.nil?

    fail 'Usuário não está vinculado a um DSEI' if dsei.nil?

    @pdsi = Pdsi.first_or_create dsei: dsei
  end

  def recover_values_to_cost(cost)
    CostUser.where(cost: cost, user: self).first_or_initialize
  end

  def user_costs
    items = cost_users

    Cost.all.each do |item|
      next if has_cost(item)
      items << CostUser.new(user: self, cost: item)
    end

    items
  end

  def has_cost(cost)
    !CostUser.where(cost: cost, user: self).first.nil?
  end
end
