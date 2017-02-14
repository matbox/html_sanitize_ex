defmodule HtmlSanitizeEx.Scrubber.BasicHTML do
  @moduledoc """
  Allows basic HTML tags to support user input for writing relatively
  plain text but allowing headings, links, bold, and so on.

  Does not allow any mailto-links, styling, HTML5 tags, video embeds etc.
  """

  require HtmlSanitizeEx.Scrubber.Meta
  alias HtmlSanitizeEx.Scrubber.Meta

  @valid_schemes ["http", "https"]

  # Removes any CDATA tags before the traverser/scrubber runs.
  Meta.remove_cdata_sections_before_scrub

  Meta.strip_comments

  Meta.allow_tag_with_these_attributes "blockquote", []
  Meta.allow_tag_with_these_attributes "br", []
  Meta.allow_tag_with_these_attributes "p", []

  Meta.strip_everything_not_covered
end
