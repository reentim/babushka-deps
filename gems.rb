dep 'gems' do
  requires {
    on :linux, 'hub.gem'
  }
  requires 'bundler.gem'
  requires 'gem-ctags.gem'
  requires 'github-auth.gem'
  requires 'pry.gem'
  requires 'wirble.gem'
  requires 'zeus.gem'
end

dep 'pry.gem'
dep 'zeus.gem'
dep 'hub.gem'

dep 'bundler.gem'     do provides 'bundle' end
dep 'gem-ctags.gem'   do provides [] end
dep 'github-auth.gem' do provides 'gh-auth' end
dep 'wirble.gem'      do provides [] end
