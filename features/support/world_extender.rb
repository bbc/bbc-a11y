Before do |test_case|
  settings.world_extensions.each do |extension_module|
    extend extension_module
  end
end
