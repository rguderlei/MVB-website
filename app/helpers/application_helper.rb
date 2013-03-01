module ApplicationHelper
  # used to print individual titles on each page
  # see  https://gist.github.com/stammy/941997
  def yield_for(content_sym, default)
    output = content_for(content_sym)
    output = default if output.blank?
    output = "MVB - " + output if !output.blank?
    output
  end
end
