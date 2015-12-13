module RevisionsHelper
  def rev_modification_info (revision)
    "<p>Modified by #{link_to revision.user.username, revision.user} on #{link_to revision.created_at.strftime("%A, %B %d, %Y at %l:%M %p"), article_revision_path(@article, revision)}</p>".html_safe
  end

end
