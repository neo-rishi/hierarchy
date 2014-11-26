module HierarchiesHelper
  def parent_options
    current_user.hierarchies.collect{|u| [u.name, u.id]}
  end
end
