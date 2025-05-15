# frozen_string_literal: true

class Components::Base < Phlex::HTML
  include Components
  include Phlexible::PageTitle
  include Phlex::Rails::Helpers::JavascriptIncludeTag
  include Phlex::Rails::Helpers::StylesheetLinkTag

  # Include any helpers you want to be available across all components
  include Phlex::Rails::Helpers::Routes

  if Rails.env.development?
    def before_template
      comment { "Before #{self.class.name}" }
      super
    end
  end
end
