dep 'gems' do
  requires 'bundler.gem'
  requires 'gem-ctags.gem'
  requires 'pry.gem'
  requires 'foreman.gem'
  requires 'wirble.gem'
end

dep 'pry.gem'
dep 'foreman.gem'

dep 'bundler.gem'     do provides 'bundle' end
dep 'gem-ctags.gem'   do provides [] end
dep 'github-auth.gem' do provides 'gh-auth' end
dep 'wirble.gem'      do provides [] end
dep 'rails.gem'       do provides [] end
