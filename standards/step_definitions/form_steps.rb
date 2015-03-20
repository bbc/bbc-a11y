Then(/^the following form elements must have a title attribute or associated label tag:$/) do |table|
  elements = table.raw.flatten.map { |selector|
    page.all(selector)
  }
  elements.flatten.each do |element|
    expect(element).to have_title_attribute_or_associated_label_tag
  end
end
