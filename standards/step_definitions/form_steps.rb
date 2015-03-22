Then(/^the following form elements must have a title attribute or associated label tag:$/) do |table|
  selectors = table.raw.flatten
  page.all_elements_matching(*selectors).each do |element|
    expect(element).to have_title_attribute_or_associated_label_tag
  end
end
