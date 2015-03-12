When /^I run Eyemask on "([^\"]+)"$/ do |file_name|
  cmd_name = File.expand_path("#{File.dirname(__FILE__)}/../../exe/eyemask")
  cmd = "#{cmd_name} process #{file_name}"
  run_simple(unescape(cmd), false)
end

When /^I run Eyemask on "([^\"]+)" with the title: "([^\"]+)"$/ do |file_name, title|
  cmd_name = File.expand_path("#{File.dirname(__FILE__)}/../../exe/eyemask")
  cmd = "#{cmd_name} process --title=\"#{title}\" #{file_name}"
  run_simple(unescape(cmd), false)
end

When /^I run Eyemask on "([^\"]+)" with the subtitle: "([^\"]+)"$/ do |file_name, subtitle|
  cmd_name = File.expand_path("#{File.dirname(__FILE__)}/../../exe/eyemask")
  cmd = "#{cmd_name} process --subtitle=\"#{subtitle}\" #{file_name}"
  run_simple(unescape(cmd), false)
end

When /^I run Eyemask on "([^\"]+)" with the template: "([^\"]+)"$/ do |file_name, template|
  cmd_name = File.expand_path("#{File.dirname(__FILE__)}/../../exe/eyemask")
  cmd = "#{cmd_name} process --template=\"#{template}\" #{file_name}"
  run_simple(unescape(cmd), false)
end

When /^I run Eyemask on "([^\"]+)" with the template: "([^\"]+)" and custom parameter "(.*?)" set to "(.*?)"$/ do |file_name, template, param_name, param_value|
  cmd_name = File.expand_path("#{File.dirname(__FILE__)}/../../exe/eyemask")
  cmd = "#{cmd_name} process --template=\"#{template}\" #{file_name} --params=\"#{param_name}\":\"#{param_value}\""
  run_simple(unescape(cmd), false)
end