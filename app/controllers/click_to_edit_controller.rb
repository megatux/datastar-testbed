class ClickToEditController < ApplicationController
  def index = render Index.new

  def edit
    datastar = Datastar.new(request:, response:, view_context:)
    datastar.merge_fragments(Edit.new, selector: "contact_#{params[:id]}")
  end

  def update
    redirect_to click_to_edit_index_path
  end

  class Index < ::Views::Base
    def view_template
      div(id: "contact_1") {
        label { "First Name: John" }
        label { "Last Name: Doe" }
        label { "Email: joe@blow.com" }
        div {
          button("data-on-click": "@get('/click_to_edit/1/edit')") {
            plain "Edit"
          }

          button("data-on-click": "@get('/click_to_edit/1/contact_reset')") {
            plain "Reset"
          }
        }
      }
    end
  end

  class Edit < ::Views::Base
    def view_template
      div(id: "contact_1", "data-signals" => "{
              id: 1, firstName: 'John', lastName: 'Doe', email: 'joe@blow.com'}") do
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
          button("data-on-click" => "@put('/click_to_edit/1',"\
            "{ headers: { 'X-Csrf-Token': '#{helpers.form_authenticity_token}' }})") {
            plain "Save"
          }
          button("data-on-click" => "@get('/click_to_edit/')") {
            plain "Cancel"
          }
        }
      end
    end
  end
end
