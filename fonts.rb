dep 'fonts' do
  def fonts
    '~/iCloud-Drive/Files/fonts/**/*.{ttf,otf}'.p.glob
  end

  def font_basenames
    fonts.map { |f| File.basename(f) }
  end

  def installed_fonts
    Dir.chdir('~/Library/Fonts'.p) { Dir.glob('**') }
  end

  met? { (installed_fonts & font_basenames).sort == font_basenames.sort }
  meet { fonts.each { |font| font.p.copy('~/Library/Fonts'.p) } }
end
