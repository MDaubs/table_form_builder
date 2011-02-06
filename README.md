# TableFormBuilder

Sometimes it's not the end of the world to use an HTML table to build form views.  Take for example http://www.twitter.com/signup.

Using table_form_for is just like form_for with the addition of the title and actions methods.  Field labels are generated automatically.  Validation errors on fields are displayed inline.  Validation errors on models are displayed before any fields.

	<% table_form_for @widget do |f| %>
		<%= f.title "Widget Properties" %>
		<%= f.text_field :name %>
		<%= f.text_field :description %>
		<%= f.check_box  :enabled %>
		<%= f.actions do %>
			<%= f.submit %>
			<%= link_to "Back", widgets_path %>
		<% end %>
	<% end %>

Now wave your CSS wand over the generated HTML and you have yourself a table-based form.
