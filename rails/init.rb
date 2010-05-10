require 'redmine'

require 'issue_due_date_patch'
require 'version_due_date_patch'
require 'deliverable_due_patch'

require 'dispatcher'
Dispatcher.to_prepare do
  Issue.send(:include, IssueDueDate::IssuePatch)
  Version.send(:include, IssueDueDate::VersionPatch)
  Deliverable.send(:include, IssueDueDate::DeliverablePatch) if Object.const_defined?("Deliverable")
end


Redmine::Plugin.register :redmine_issue_due_date do
  name 'Version Slip Notifier'
  url 'http://github.com/comotion/redmine-version-slip'
  author 'Kacper Wysocki of Redpill Linpro'
  author_url 'http://kacper.blogs.linpro.no'
  
  description 'Plugin to notify about modifications in due dates.'
  version '0.1.0'
  requires_redmine :version_or_higher => '0.8.0'
end
