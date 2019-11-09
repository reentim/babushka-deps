dep 'gems' do
  requires 'pry.gem'
end

dep 'foreman.gem'
dep 'pry.gem'
dep 'rails.gem'

dep 'bundler.gem' do
  provides 'bundle'
end

