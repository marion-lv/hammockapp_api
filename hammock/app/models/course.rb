class Course < ActiveRecord::Base

  belongs_to :user
  has_many :course_modules, dependent: :destroy
  after_initialize :init


  def init
    self.status ||= "interested"
  end

  def self.build_with_clone(courseitem, current_user, status = 'interested')
    attributes = courseitem.attributes
    self.set_attributes(attributes, current_user, status)
    duplicate = self.where(user: current_user.id, name: courseitem.name).first
    duplicate ? duplicate : self.new(attributes)
  end

  def self.build_with_user(params, current_user)
    params[:user_id] ||= current_user.id
    self.new(params)
  end

  private

  def self.set_attributes(attributes, current_user, status)
    attributes[:status] = status
    attributes[:id] = nil
    attributes[:user_id] = current_user.id
  end




end
