class ObservationPolicy < ApplicationPolicy

  def update?
    is_owner? || is_admin?
  end

  def edit?
    update?
  end

end
