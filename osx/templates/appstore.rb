meta :appstore do
  def app_name
    name.sub(/\.appstore$/, '.app')
  end

  template {
    met? {
      ("/Applications/#{app_name}".p.exists? || :fail).tap { |result|
        unmeetable!("Install #{app_name} from the App Store!").call if result == :fail
      }
    }
  }
end
