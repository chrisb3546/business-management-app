# Business Management App

Generic app designed to manage a businesses contracted employees, offered services, and completed jobs.

# Installation Guide

Clone project in terminal. Run your server. The gems you will need for this installation are as follows: gem 'rails', '~> 6.0.3', '>= 6.0.3.2', gem 'sqlite3', '~> 1.4', gem 'puma', '~> 4.1', gem 'sass-rails', '>= 6', gem 'webpacker', '~> 4.0',  gem 'bcrypt', '~> 3.1.7', gem 'omniauth', gem 'dotenv-rails', gem 'omniauth-google-oauth2'


<%if logged_in?%>
  <h1> <%=current_user.username%></h1>
  <%= link_to 'logout', logout_path, method: "delete" %>
  <%= link_to 'home', user_path(current_user) %>
  <br>
  <%else %>
  <%= link_to 'home', root_path %>
  <%end%>