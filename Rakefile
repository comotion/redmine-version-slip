#!/usr/bin/env ruby
require 'redmine_plugin_support'

Dir[File.expand_path(File.dirname(__FILE__)) + "/lib/tasks/**/*.rake"].sort.each { |ext| load ext }

RedminePluginSupport::Base.setup do |plugin|
  plugin.project_name = 'redmine_version_slip'
  plugin.default_task = [:spec]
end
begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "redmine_version_slip"
    s.summary = "Plugin to notify about modifications in due dates."
    s.email = "kwy@redpill-linpro.com"
    s.homepage = "http://github.com/comotion/redmine-version-slip"
    s.description = "Plugin to notify about modifications in due dates."
    s.authors = ["Kacper Wysocki"]
    s.rubyforge_project = "redmine_version_slip" # TODO
    s.files =  FileList[
                        "[A-Z]*",
                        "init.rb",
                        "rails/init.rb",
                        "{bin,generators,lib,test,app,assets,config,lang}/**/*",
                        'lib/jeweler/templates/.gitignore'
                       ]
  end
  Jeweler::GemcutterTasks.new
  Jeweler::RubyforgeTasks.new do |rubyforge|
    rubyforge.doc_task = "rdoc"
  end
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

