dep 'gems' do
  requires 'ruby'

  requires 'bundler.gem'
  requires 'pry.gem'
  requires 'foreman.gem'
  requires 'rails.gem'
end

dep 'pry.gem'
dep 'foreman.gem'

dep 'rails.gem'

dep 'bundler.gem' do
  provides 'bundle'
end

