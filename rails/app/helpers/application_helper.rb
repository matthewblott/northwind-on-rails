module ApplicationHelper
  include Pagy::Frontend

  def checkbox_field(model, field_name)
    render("checkbox_field", model: model, field_name: field_name)
  end

  def date_field(model, field_name)
    render("date_field", model: model, field_name: field_name)
  end

  def email_field(model, field_name)
    render("email_field", model: model, field_name: field_name)
  end

  def money_field(model, field_name)
    render("money_field", model: model, field_name: field_name)
  end

  def number_field(model, field_name)
    render("number_field", model: model, field_name: field_name)
  end

  def text_field(model, field_name)
    render("text_field", model: model, field_name: field_name)
  end

end
