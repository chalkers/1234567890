task :git_submodules do
  puts `rm -rf lib/haml`
  puts `git clone git://github.com/nex3/haml.git lib/haml 2>&1`
end