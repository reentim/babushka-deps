dep 'fonts' do
  # requires 'richo:font'
  # requires 'courier_prime.ttf'
  # => /usr/local/babushka/lib/babushka/helpers/log_helpers.rb:78:in
  # `removed!': Passing options to 'meta' never actually did anything :) It has
  # been removed after being deprecated.

end

dep 'courier_prime.ttf' do
  source 'http://quoteunquoteapps.com/downloads/courier-prime.zip'
end
