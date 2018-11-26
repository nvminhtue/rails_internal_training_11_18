# frozen_string_literal: true

module ApplicationHelper
  def full_title page_title = ""
    base_title = t "base_title"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def index_of_book count, page, perpage
    page = 1 if page.blank?
    count + 1 + (page.to_i - 1) * perpage
  end
end
