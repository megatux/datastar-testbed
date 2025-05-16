class ClickToEditController < ApplicationController
  def index
    render Index.new
  end

  def show
    if datastar.sse?
      datastar.merge_fragments(Show.new(params[:id]))
    else
      render ViewWithComponent.new(Show.new(params[:id]))
    end
  end

  def edit
    datastar.merge_fragments(Edit.new(params[:id]))
  end

  def update
    redirect_to click_to_edit_index_path
  end

  private

  def datastar = @datastar ||= Datastar.new(request:, response:, view_context:)

  class ViewWithComponent < Views::Base
    def initialize(component)
      @component = component
    end

    def view_template = render @component
  end

  class Index < Views::Base
    def view_template
      render Show.new(1)
    end
  end

  class Edit < Components::Base
    def initialize(id)
      @id = id
    end

    def view_template
      div(id: "contact_#{@id}", "data-signals" => "{
              id: #{@id}, firstName: 'John', lastName: 'Doe', email: 'joe@blow.com'}") do
        div(class: "form-control") do
          label { "First Name" }
          input type: "text", "data-bind" => "firstName"
        end
        div {
          label { "Last Name" }
          input type: "text", "data-bind" => "lastName"
        }
        div {
          label { "Email" }
          input type: "text", "data-bind" => "email"
        }
        div {
          button("data-on-click" => "@put('#{click_to_edit_path(@id)}',"\
            "{ headers: { 'X-Csrf-Token': '#{helpers.form_authenticity_token}' }})") {
            plain "Save"
          }
          button("data-on-click" => "@get('/click_to_edit/#{@id}')") {
            plain "Cancel"
          }
        }
      end
    end
  end

  class Show < Components::Base
    def initialize(id)
      @id = id
    end

    def view_template
      div(id: "contact_#{@id}") {
        label { "First Name: John" }
        label { "Last Name: Doe" }
        label { "Email: joe@blow.com" }
        div {
          button("data-on-click": "@get('/click_to_edit/#{@id}/edit')") {
            plain "Edit"
          }

          button("data-on-click": "@get('/click_to_edit/#{@id}')") {
            plain "Reset"
          }
        }
      }
    end
  end
end
