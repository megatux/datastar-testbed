# frozen_string_literal: true

class Views::Base < Components::Base
  # The `Views::Base` is an abstract class for all your views.

  def around_template
    doctype

    html do
      head do
        page_title

        meta charset: "UTF-8"
        meta name: "viewport", content: "width=device-width, initial-scale=1"
        meta name: "google", content: "notranslate"

        stylesheet_link_tag :app

        script type: "module",
          src: "https://cdn.jsdelivr.net/gh/starfederation/datastar@v1.0.0-beta.11/bundles/datastar.js"      end

      body do
        main(class: "responsive") { super }
      end
    end
  end
end
