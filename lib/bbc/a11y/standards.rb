require 'bbc/a11y/standards/anchor_hrefs'
require 'bbc/a11y/standards/content_follows_headings'
require 'bbc/a11y/standards/exactly_one_main_heading'
require 'bbc/a11y/standards/exactly_one_main_landmark'
require 'bbc/a11y/standards/form_labels'
require 'bbc/a11y/standards/heading_hierarchy'
require 'bbc/a11y/standards/image_alt'
require 'bbc/a11y/standards/language_attribute'
require 'bbc/a11y/standards/tab_index'

module BBC
  module A11y
    module Standards
      def self.for(page_settings)
        all.reject { |standard|
          page_settings.skip_standard?(standard)
        }
      end

      def self.matching(name)
        all.select { |standard|
          name.match(standard.name)
        }
      end

      def self.all
        [
          AnchorHrefs,
          ContentFollowsHeadings,
          FormLabels,
          HeadingHierarchy,
          ImageAlt,
          ExactlyOneMainHeading,
          ExactlyOneMainLandmark,
          LanguageAttribute,
          TabIndex
        ]
      end
    end
  end
end
