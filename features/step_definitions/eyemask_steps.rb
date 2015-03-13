PROCESS_CMD = "process"

def run_eyestalk_process(file_string, param_string="")
  cmd_name = File.expand_path("#{File.dirname(__FILE__)}/../../exe/eyemask")
  cmd = "#{cmd_name} #{PROCESS_CMD} #{file_string} #{param_string}"
  run_simple(unescape(cmd), false)
end

When /^I run Eyemask on "([^\"]+)"$/ do |file_name|
  run_eyestalk_process file_name
end

When /^I run Eyemask on "([^\"]+)" with the title: "([^\"]+)"$/ do |file_name, title|
  run_eyestalk_process file_name, "--title=\"#{title}\""
end

When /^I run Eyemask on "([^\"]+)" with the subtitle: "([^\"]+)"$/ do |file_name, subtitle|
  run_eyestalk_process file_name, "--subtitle=\"#{subtitle}\""
end

When /^I run Eyemask on "([^\"]+)" with the author: "([^\"]+)"$/ do |file_name, author|
  run_eyestalk_process file_name, "--authors=\"#{author}\""
end

When /^I run Eyemask on "([^\"]+)" with the authors: "([^\"]+)" and "([^\"]+)"$/ do |file_name, author_1, author_2|
  run_eyestalk_process file_name, "--authors=\"#{author_1}\" \"#{author_2}\""
end

When /^I run Eyemask on "([^\"]+)" with the template "([^\"]+)" and the author: "([^\"]+)"$/ do |file_name, template, author|
  run_eyestalk_process file_name, "--template=\"#{template}\" --authors=\"#{author}\""
end

When /^I run Eyemask on "([^\"]+)" with the template: "([^\"]+)"$/ do |file_name, template|
  run_eyestalk_process file_name, "--template=\"#{template}\""
end

When /^I run Eyemask on "([^\"]+)" with the template: "([^\"]+)" and custom parameter "(.*?)" set to "(.*?)"$/ do |file_name, template, param_name, param_value|
  run_eyestalk_process file_name, "--template=\"#{template}\" --params=\"#{param_name}\":\"#{param_value}\""
end

When /^I pipe the file "([^\"]+)" into Eyemask$/ do |file_name|
  cmd_name = File.expand_path("#{File.dirname(__FILE__)}/../../exe/eyemask")
  run_interactive(unescape("#{cmd_name} #{PROCESS_CMD} -"))
  pipe_in_file(file_name)
  close_input
end