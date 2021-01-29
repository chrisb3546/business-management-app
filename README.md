# Business Management App

Generic app designed to manage a businesses contracted employees, offered services, and completed jobs.

# Installation Guide

Clone project in terminal. Run your server. The gems you will need for this installation are as follows: gem 'rails', '~> 6.0.3', '>= 6.0.3.2', gem 'sqlite3', '~> 1.4', gem 'puma', '~> 4.1', gem 'sass-rails', '>= 6', gem 'webpacker', '~> 4.0',  gem 'bcrypt', '~> 3.1.7', gem 'omniauth', gem 'dotenv-rails', gem 'omniauth-google-oauth2'

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <%= link_to 'Business Management', root_path, class: "navbar-brand", id:"logo" %>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <li><%= link_to 'See all techs', service_technicians_path, class:"nav-link" %></li>
        </li>
        <li class="nav-item ">
         <li><%= link_to 'all services', services_path, class:"nav-link" %> </li> 
        </li>
        <li class="nav-item ">
        <%= link_to 'logout', logout_path, method: "delete", %>
        </li>
      </ul>
      </form>
    </div>
  </div>
</nav>
<%if logged_in?%>
  <h1> <%=current_user.username%></h1>
  <%= link_to 'logout', logout_path, method: "delete" %>
  <%= link_to 'home', user_path(current_user) %>
  <br>
  <%else %>
  <%= link_to 'home', root_path %>
  <%end%>