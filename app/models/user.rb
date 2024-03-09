class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :set_default_role

  has_many    :passes
  belongs_to  :role, optional: true

  def admin?
    role.rolename == 'admin'
  end

  def guard?
    role.rolename == 'guard'
  end

  def user?
    role.rolename == 'user'
  end

  def set_default_role
    self.role ||= Role.find_by(rolename: 'user')
  end

end
