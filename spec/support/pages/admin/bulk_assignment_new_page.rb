class AdminBulkAssignmentNewPage < SitePrism::Page
  set_url "/admin/splits/{split_id}/bulk_assignments/new"

  element :error_box, "div.alert"

  section :create_form, "form" do
    element :identifiers_listing, "textarea#bulk_assignment_creation_identifiers_listing"
    element :identifier_creation_warning, "div#identifier_creation_warning"
    element :identifier_type, "select#bulk_assignment_creation_identifier_type_id"
    element :variant, "select#bulk_assignment_creation_variant"
    element :reason, "input#bulk_assignment_creation_reason"
    element :force, "input#bulk_assignment_creation_force_identifier_creation"
    element :submit_button, "input[name=commit]"
  end
end
