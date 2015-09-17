module ApplicationHelper

  def breadcrumbs(links)
    render 'refills/breadcrumbs', {links: links}
  end

end
