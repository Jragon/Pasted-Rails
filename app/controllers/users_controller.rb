class UsersController < InheritedResources::Base
  # actions only: [:create, :new]
  def create
    create!
    session['user_id'] = resource.id
  end
end
