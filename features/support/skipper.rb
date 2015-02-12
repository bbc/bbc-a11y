Before do |test_case|
  if settings.scenarios_to_skip.any? { |name| test_case.name.match name }
    skip_this_scenario "Configured to be skipped"
  end
end
