class ExamplesController < ApplicationController
  def index
    render Index.new
  end

  class Index < ::Views::Base
    def view_template
      h1 { "hi" }
    end
  end
end
