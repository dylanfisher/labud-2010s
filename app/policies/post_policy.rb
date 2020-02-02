class PostPolicy < BlockRecordPolicy
  def show?
    can_show = true
    can_show = can_show && record.published?
    can_show = can_show || edit?
    can_show
  end

  def index?
    true
  end

  def dashboard?
    true
  end

  def create?
    owner_of_record? || (user.present? && record.new_record?)
  end

  def new?
    create?
  end

  def update?
    new?
  end

  def edit?
    update?
  end

  def destroy?
    edit?
  end

  def view_hidden?
    edit?
  end

  private

  def owner_of_record?
    return false unless user.present?
    user.try(:admin?) || (user == record.try(:user))
  end
end
