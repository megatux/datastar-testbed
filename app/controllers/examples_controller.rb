class ExamplesController < ApplicationController
  def index = render Index.new

  def stream01 = render Stream01.new

  def stream02 = render Stream02.new

  class Index < ::Views::Base
    def view_template
      h1 { "Datastar Examples" }
      ul {
        li { a(href: click_to_edit_index_path) { "Click to edit" } }
        li { a(href: "stream01") { "Stream example 01" } }
        li { a(href: "stream02") { "Stream example 02" } }
      }
    end
  end

  class Stream01 < ::Views::Base
    def view_template
      h1 { "Stream Example 01" }
      p { "Nothing yet" }
    end
  end

  class Stream02 < ::Views::Base
    def view_template
      h1 { "Stream Example 02" }
      p { "Nothing yet" }
    end
  end
end
