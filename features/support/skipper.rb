Before do |test_case|
  if settings.skip_test_case?(test_case)
    skip_this_scenario "Configured to be skipped"
  end
end
