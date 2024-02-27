Redmine::Plugin.register :burndowns do
  name 'Burndowns plugin'
  author 'Aditya Mehar'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  menu :application_menu, :burndowns, { controller: 'burndowns', action: 'index' }, caption: 'Burndowns'
end
