require 'active_support/concern'

module TableFormBuilder
  module ApplicationHelper
    extend ActiveSupport::Concern

    module InstanceMethods

      # Wraps a standard form_for inside of a table element and sets the builder to TableFormBuilder
      def table_form_for(record_or_name_or_array, *args, &proc)
        options = args.extract_options!
        content_tag(:table, :class => "form") do
          form_for(record_or_name_or_array, *(args << options.merge(:builder => TableFormBuilder::Builder)), &proc)
        end
      end

    end

  end

end
