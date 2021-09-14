# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'sorta-lens'
  s.homepage = 'https://github.com/sorta-rb/sorta-lens'
  s.version     = '0.1.0'
  s.summary     = 'Simple lensing for your data extraction needs'
  s.authors     = ['Ivan Chinenov']
  s.email       = 'ichinenov@gmail.com'
  s.files       = ['lib/sorta-lens.rb',
                   'lib/lens/lens.rb',
                   'lib/lens/typed_lens.rb',
                   'lib/lens/lens_builder.rb']
  s.metadata = { 'source_code_uri' => 'https://github.com/sorta-rb/sorta-lens' }
  s.license = 'MIT'
  s.add_development_dependency 'rspec', '~> 3.0'
end
