module NavigationHelpers
  module Refinery
    module SuccessStories
      def path_to(page_name)
        case page_name
        when /the list of success_stories/
          admin_success_stories_path

         when /the new success_story form/
          new_admin_success_story_path
        else
          nil
        end
      end
    end
  end
end
