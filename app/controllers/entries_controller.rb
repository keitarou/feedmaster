class EntriesController < InheritedResources::Base
  def index
    conditions = []
    conditions = ["title like ?", "%#{params[:title]}%"] if params[:title]

    render :json => {
      :items => Kaminari.paginate_array(Entry.find(:all, :conditions => conditions, :order => "published_at DESC")).page(params[:page]).per(params[:num])
    }
  end
end
