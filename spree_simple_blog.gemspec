Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_simple_blog'
  s.version     = '3.0.2'
  s.summary     = 'Toto style blogging for Spree'
  s.description = 'Toto style blogging for Spree'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'David North'
  s.email             = 'david@railsdog.com'
  s.homepage          = 'http://spreecommerce.com'
  s.rubyforge_project = 'spree_simple_blog'

  s.files        = Dir['README.markdown', 'lib/**/*', 'app/**/*', 'config/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = true

  s.add_dependency('spree_core', '>= 0.30.0.beta1')
  s.add_dependency('rdiscount', '1.5.5')

end
