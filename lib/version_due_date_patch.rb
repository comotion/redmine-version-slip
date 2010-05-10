require_dependency 'version'

module IssueDueDate
  module VersionPatch
    def self.included(base)
      base.send(:include, InstanceMethods)

      # Same as typing in the class 
      base.class_eval do
        unloadable # Send unloadable so it will not be unloaded in development
        before_save :notify_version_slip
      end
    end

    module InstanceMethods
      # Added as a +before_save+ to push out the updated due_date to the issues
      def notify_version_slip
	# create a news entry for changed due date
        orig_ver = Version.find_by_id(self.id)
        if (orig_ver and orig_ver.due_date != self.due_date)
		@news = News.new(:project=> self.project,
				 :author => User.current,
				 :title => "Milestone #{self.name} changed due date.",
			 	 :description => "Milestone #{self.name} changed from from #{orig_ver.due_date} to #{self.due_date}.")
		@news.save
	end
        
	# update all issue due dates (check: may generate more spam?)
        self.fixed_issues.each do |issue|
          if issue.due_date.blank? || issue.due_date_set_by_version?
            issue.init_journal(User.current)
            issue.due_date = self.due_date
            issue.save
          end
        end

      end
    end    
  end
end
