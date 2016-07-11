class ObservationPolicy < ApplicationPolicy

  def edit?
    is_owner? || is_admin?
  end

end
