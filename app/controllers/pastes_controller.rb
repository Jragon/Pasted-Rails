class PastesController < InheritedResources::Base
  def collection
    if params[:language]
      language = Language.find_by_name(params[:language])
      @pastes = language.pastes
    else  
      @pastes = Paste.scoped
    end

    @pastes.order("created_at DESC")
  end

  def create
    if current_user
      params[:paste][:user_id] = current_user.id
    end

    create!
  end
end