module TableFormBuilder
  class Builder < ActionView::Helpers::FormBuilder

    %w{text_field password_field}.each do |method_name|
      define_method(method_name) do |field, *args|
        options = args.last.is_a?(Hash) ? args.pop : {}
        label   = label(field, options[:label])
        extra   = options[:extra].nil? ? "" : @template.content_tag(:span, :class => "extra") { options[:extra] }
        errors  = generate_errors(field)
        @template.content_tag(:tr) do
          @template.content_tag(:th, label) + @template.content_tag(:td, super(field, *args) + extra + errors)
        end
      end
    end

    def check_box(field, *args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      label   = label(field, options[:label])
      extra   = options[:extra].nil? ? "" : @template.content_tag(:span, :class => "extra") { options[:extra] }
      @template.content_tag(:tr) do
        @template.content_tag(:th) + @template.content_tag(:td, super(field, *args) + label + extra)
      end
    end

    def title(text)
      @template.content_tag(:tr) do
        @template.content_tag(:th) + @template.content_tag(:td) do
          @template.content_tag(:h3, text)
        end
      end
    end

    def actions(&block)
      @template.content_tag(:tr) do
        @template.content_tag(:th) + @template.content_tag(:td, @template.capture(&block))
      end
    end

    def generate_errors(field)
      @object.errors[field].collect{|e| @template.content_tag(:div, :class => "error"){generate_error_message(field, e)}}.join.html_safe
    end

    def generate_error_message(field, error)
      "#{field.to_s.humanize} #{error}"
    end

  end
end
