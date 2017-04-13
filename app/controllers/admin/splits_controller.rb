class Admin::SplitsController < AuthenticatedAdminController
  def index
    @splits = Split.active.order(:name)
  end

  def show
    @split_detail = Split.find(params[:id]).detail
  end
end
