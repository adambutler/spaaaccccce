<% if @alias.errors.empty? %>
  $("#link").html('<%= link_to @alias.full_lengthened_url, @alias.full_lengthened_url %>')
<% else %>
  $("#link").html('<span><%= @alias.errors.full_messages.to_sentence %></span>')
<% end %>

