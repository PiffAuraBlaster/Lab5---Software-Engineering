# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tictactoe/version"

Gem::Specification.new do |s|
  s.name        = "tictactoe"
  s.version     = TicTacToe::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Alex Noguchi"]
  s.email       = ["alex@small-affair.com"]
  s.homepage    = ""
  s.summary     = %q{CLI TicTacToe}
  s.description = %q{CLI TicTacToe. Allows users to play tic-tac-toe in the terminal.}
  
  s.add_development_dependency "rspec", "~>3.2.0"
  s.add_development_dependency "yard", "~>0.8.7.0"
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end