task :git_submodules do
  puts `git submodule add git://github.com/nex3/haml.git lib/haml 2>&1`
  puts `git submodule init 2>&1`
  puts `git submodule update 2>&1`
end