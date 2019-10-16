# https://github.com/richo/babushka-deps/blob/master/templates/font.rb

meta :font do
	accepts_list_for :source
	accepts_list_for :provides

	template {
		met? {
			provides.all?{|font| File.exists?(File.join("/".p, "Library", "Fonts", "#{font}.ttf"))}
		}

		meet {
			source.each {|uri|
				Babushka::Resource.extract uri do
					shell "cp *.ttf #{File.join("/".p, "Library", "Fonts")}"
				end
			}
		}
	}
end
