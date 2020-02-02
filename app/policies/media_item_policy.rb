class MediaItemPolicy < ApplicationPolicy
  def index?
    admin? || editor? || contributor?
  end

  def dashboard?
    index?
  end

  def create?
    admin? || editor? || contributor?
  end

  def edit?
    # admin? || owner_of_record?
    create?
  end

  def update?
    edit?
  end

  def destroy?
    update?
  end

  def update_multiple?
    destroy?
  end

  private

  def owner_of_record?
    return false unless user.present?
    user.try(:admin?) || (user == record.try(:user))
  end
end
