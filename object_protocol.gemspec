# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{object_protocol}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["James Tucker"]
  s.date = %q{2008-10-02}
  s.description = %q{An Object Protocol for ruby. Simply implements send and receive using a  serializer that responds to #dump and #load. This protocol does not handle the  "packetization" or framing of data. This should be performed by an external  handler such as my sized_header_protocol.}
  s.email = %q{raggi@rubyforge.org}
  s.extra_rdoc_files = ["History.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "lib/object_protocol.rb", "object_protocol.gemspec", "spec/.bacon", "spec/helper.rb", "spec/runner", "spec/spec_object_protocol.rb", "tasks/ann.rake", "tasks/autospec.rake", "tasks/bones.rake", "tasks/gem.rake", "tasks/git.rake", "tasks/manifest.rake", "tasks/notes.rake", "tasks/post_load.rake", "tasks/rdoc.rake", "tasks/rubyforge.rake", "tasks/setup.rb", "tasks/spec.rake", "tasks/svn.rake", "tasks/test.rake"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/raggi/object_protocol}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{object_protocol}
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{A protocol for sending and receiving ruby objects in serialized form}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
