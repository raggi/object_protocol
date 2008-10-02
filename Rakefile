load 'tasks/setup.rb'

ensure_in_path 'lib'
require 'object_protocol'

task :default => 'spec:run'

PROJ.name = 'object_protocol'
PROJ.summary = 'A protocol for sending and receiving ruby objects in serialized form'
PROJ.authors = 'James Tucker'
PROJ.email = 'raggi@rubyforge.org'
PROJ.url = 'http://github.com/raggi/object_protocol'
PROJ.rubyforge.name = 'object_protocol'
PROJ.version = ObjectProtocol.version

PROJ.exclude = %w(tmp$ bak$ ~$ CVS \.git \.hg \.svn ^pkg ^doc \.DS_Store
  \.cvs \.svn \.hgignore \.gitignore \.dotest \.swp$ ~$)

namespace :gem do
  task :spec do
    open(PROJ.name + '.gemspec', 'w') { |f| f << PROJ.gem._spec.to_ruby }
  end
end