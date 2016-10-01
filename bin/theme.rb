class Theme
  def initialize(variant)
    @variant = variant
  end

  def name
    @variant[:name]
  end

  def header
    puts <<-EOS
" Vim color scheme
"
" This file is generated, please check bin/generate.rb.
"
" Name:       #{name}.vim
" Maintainer: Jean-Hadrien Chabran <jh@chabran.fr>
" License:    MIT

set background=dark

hi clear
if exists('syntax_on')
   syntax reset
endif

let g:colors_name = '#{name}'

" These commands are generated, see bin/generate.rb.
    EOS
  end

  def method_missing(method_id, *args)
    if @variant.key?(method_id)
      @variant[method_id]
    else
      super
    end
  end

  def hi(group, options={})
    tokens = []
    tokens << 'hi'
    tokens << group.to_s

    fg = options.delete(:fg) {|_| lgray }
    tokens << "guifg=#{fg[:gui]}"
    tokens << "ctermfg=#{fg[:cterm]}"

    bg = options.delete(:bg) {|_| bgray }
    tokens << "guibg=#{bg[:gui]}"
    tokens << "ctermbg=#{bg[:cterm]}"

    rest = options.keys.join(',')
    rest = 'NONE' if rest.empty?
    tokens << "gui=#{rest}"
    tokens << "cterm=#{rest}"
    tokens << "term=#{rest}"

    puts tokens.join(' ')
  end
end
