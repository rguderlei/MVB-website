module ApplicationHelper
  # used to print individual titles on each page
  def yield_for(content_sym, default)
    output = content_for(content_sym)
    output = default if output.blank?
    output = "MVB - " + output if !output.blank?
    output
  end
end
