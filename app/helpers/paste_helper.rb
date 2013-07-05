module PasteHelper
  def highlight code, language
    raw CodeRay.scan(code, language.name).div(:line_numbers => :table)
  end

  def lines code, language
    CodeRay.scan(code, language.name).loc
  end
end