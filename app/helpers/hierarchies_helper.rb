module HierarchiesHelper

  # Get all parent record and use in new record in select tag
  def parent_options
    current_user.hierarchies.collect{|u| [u.name, u.id]}
  end
end
