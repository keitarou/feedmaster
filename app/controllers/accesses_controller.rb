class AccessesController < InheritedResources::Base
  def index
    if params[:entry_id] && params[:entry_id].to_i > 0
     render :text => Access.new(:entry_id => params[:entry_id]).save ? "success": "error"
    else
     render :text => "error"
    end
  end
end
