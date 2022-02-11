class FlatpickrInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options)
    template.content_tag(:div, class: "input-group")
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    "#{@builder.text_field(attribute_name, merged_input_options)}".html_safe
  end
end