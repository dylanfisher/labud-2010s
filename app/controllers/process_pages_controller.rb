class ProcessPagesController < PagesController
  def student
    set_page
    render :show
  end

  def teacher
    set_page
    render :show
  end
end
