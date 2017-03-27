module ApplicationHelper
  def link_to_function(name, *args, &block)
    html_options = args.extract_options!.symbolize_keys

    function = block_given? ? update_page(&block) : args[0] || ''
    # function = format_form_params(function)
    onclick = "#{"#{html_options[:onclick]}; " if html_options[:onclick]}#{function}; return false;"
    href = html_options[:href] || '#'

    content_tag(:a, name, html_options.merge(:href => href, :onclick => onclick))
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    fields = format_form_params(escape_javascript(fields), association.to_s)
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{fields}\")")
  end

  def format_form_params(fields, association)
    fields.slice!("[#{association}]")
    fields
  end

end
