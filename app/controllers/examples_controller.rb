class ExamplesController < ApplicationController
  def index
    render Index.new
  end

  def stream01
    render Stream01.new
  end

  class Index < ::Views::Base
    def view_template
      h1 { "Datastar Examples" }
      ul {
        li {
          a(href: "stream01") { "Stream example 01" }
        }
      }
    end
  end

  class Stream01 < ::Views::Base
    def view_template
      h1 { "Stream Example 01" }
      p { "Nothing yet" }
    end
  end

end
