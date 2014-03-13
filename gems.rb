dep 'gems' do
  requires 'bundler.gem'
  requires 'gem-ctags.gem'
  requires 'github-auth.gem'
  requires 'pry.gem'
  requires 'wirble.gem'
  requires 'zeus.gem'
end

dep 'pry.gem'
dep 'zeus.gem'

dep 'bundler.gem'     do provides 'bundle' end
dep 'gem-ctags.gem'   do provides [] end
dep 'github-auth.gem' do provides 'gh-auth' end
dep 'wirble.gem'      do provides [] end
