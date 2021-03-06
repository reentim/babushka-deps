dep 'fonts' do
  requires 'recursive.font'
end

dep 'recursive.font' do
  source 'https://github.com/arrowtype/recursive/releases/download/v1.022/recursive-static_fonts-b020.zip'
  provides [
    'Recursive Mono-Linear Bold Italic.otf',
    'Recursive Mono-Linear Bold.otf',
    'Recursive Mono-Linear Italic.otf',
    'Recursive Mono-Linear Regular.otf',
  ]
end

dep 'fonts-copied' do
  met? { (installed_fonts & font_basenames).sort == font_basenames.sort }
  meet { fonts.each { |font| font.p.copy('~/Library/Fonts'.p) } }
end

def fonts
  '~/iCloud-Drive/Files/fonts/**/*.{ttf,otf}'.p.glob
end

def font_basenames
  fonts.map { |f| File.basename(f) }
end

def installed_fonts
  Dir.chdir('~/Library/Fonts'.p) { Dir.glob('**') }
end
