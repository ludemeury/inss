# frozen_string_literal: true

Kaminari.configure do |config|
  Kaminari.configure do |config|
    config.page_method_name = :per_page_kaminari
    config.default_per_page = 5  # Set the default number of items per page
    config.max_per_page = nil  # No limit on max items per page
    config.window = 4  # Number of page links to show around the current page
    config.outer_window = 0  # Don't show outer window page links
    config.left = 0  # Don't show any left page links
    config.right = 0  # Don't show any right page links
  end  
end
