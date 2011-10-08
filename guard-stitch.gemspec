# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "guard-stitch/version"

Gem::Specification.new do |s|
  s.name        = "guard-stitch"
  s.version     = Guard::Stitch::VERSION
  s.authors     = ["stereosteve"]
  s.email       = ["stereosteve@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Guard for stitch-rb}
  s.description = %q{Run stitch-rb on your javascripts.}

  s.rubyforge_project = "guard-stitch"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
