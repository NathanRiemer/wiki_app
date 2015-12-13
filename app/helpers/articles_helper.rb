module ArticlesHelper
  def creation_info
    "<p>Created by #{link_to @article.first_rev.user.username, @article.first_rev.user} on #{@article.created_at.strftime("%A, %B %d, %Y at %l:%M %p")}</p>".html_safe
  end

  def modification_info
    "<p>Modified by #{link_to @article.current_rev.user.username, @article.current_rev.user} on #{@article.created_at.strftime("%A, %B %d, %Y at %l:%M %p")}</p>".html_safe
  end

end
