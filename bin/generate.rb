#!/usr/bin/env ruby

require './theme'

variants = {
  dark: {
    background: "dark",
    name: "monochrome-dark",

    white:    { gui: 'White', cterm: 15 },
    black:    { gui: 'Black', cterm: 16 },
    bgray:    { gui: '#202020', cterm: 234 },
    lgray:    { gui: 'LightGray', cterm: 252 },
    cgray:    { gui: '#737373', cterm: 243 },
    dgray:    { gui: 'DarkGray', cterm: 248 },
    color:    { gui: '#778899', cterm: 67 },
    green:    { gui: '#859900', cterm: 64 },
    red:      { gui: '#dc322f', cterm: 160 },
    contrast: { gui: 'Yellow', cterm: 208 }
  },
  light: {
    background: "light",
    name: "monochrome-light",

    white:    { gui: 'White', cterm: 16 },
    black:    { gui: 'Black', cterm: 15 },
    lgray:    { gui: '#202020', cterm: 234 },
    bgray:    { gui: 'LightGray', cterm: 252 },
    cgray:    { gui: '#737373', cterm: 243 },
    dgray:    { gui: 'DarkGray', cterm: 248 },
    color:    { gui: '#778899', cterm: 67 },
    green:    { gui: '#859900', cterm: 64 },
    red:      { gui: '#dc322f', cterm: 160 },
    contrast: { gui: 'Yellow', cterm: 208 }
  }
}

v = Theme.new(variants[ARGV[0].to_sym])

# Basic colors.
v.hi :Normal
v.hi :Cursor, fg: v.black, bg: v.lgray

# Cursor line.
v.hi :CursorLine, bg: v.bgray
v.hi :CursorLineNr, fg: v.white, bold: true

# Folding.
v.hi :FoldColumn, fg: v.dgray
v.hi :Folded

# Line numbers gutter.
v.hi :LineNr, fg: v.dgray

# Main groups for programming langages.
v.hi :Statement, fg: v.white, bold: true
v.hi :PreProc, fg: v.white, bold: true
v.hi :String, fg: v.cgray
v.hi :Comment, fg: v.cgray
v.hi :Constant
v.hi :Type, fg: v.white, bold: true
v.hi :Function, fg: v.white
v.hi :Identifier
v.hi :Special
v.hi :MatchParen, fg: v.black, bg: v.lgray

# UI
v.hi :ColorColumn, bg: v.black
v.hi :StatusLine, bg: v.bgray, fg: v.lgray
v.hi :StatusLineNC, bg: v.bgray, fg: v.bgray

# Diff
v.hi :DiffText, bg: v.contrast, fg: v.bgray
v.hi :DiffAdd, bg: v.green, fg: v.white
v.hi :DiffDelete, bg: v.red, fg: v.white
v.hi :DiffChange, bg: v.bgray, fg: v.color

# Ruby tweaks.
v.hi :rubyConstant
v.hi :rubySharpBang, fg: v.cgray
v.hi :rubyStringDelimiter, fg: v.color
v.hi :rubyStringEscape, fg: v.color
v.hi :rubyRegexpEscape, fg: v.color
v.hi :rubyRegexpAnchor, fg: v.color
v.hi :rubyRegexpSpecial, fg: v.color

# Perl tweaks.
v.hi :perlSharpBang, fg: v.cgray
v.hi :perlStringStartEnd, fg: v.color
v.hi :perlStringEscape, fg: v.color
v.hi :perlMatchStartEnd, fg: v.color

# Python tweaks.
v.hi :pythonEscape, fg: v.color

# JavaScript tweaks.
v.hi :javaScriptFunction, fg: v.white, bold: true

# Elixir tweaks.
v.hi :elixirDelimiter, fg: v.color

# Search.
v.hi :Search, fg: v.white, bg: v.color
v.hi :Visual, fg: v.white, bg: v.color

# Tildes at the bottom of a buffer, etc.
v.hi :NonText, fg: v.dgray

# File browsers.
v.hi :Directory, fg: v.white, bold: true

# Markup.
v.hi :Title, fg: v.white, bold: true
v.hi :markdownHeadingDelimiter, fg: v.white, bold: true
v.hi :markdownHeadingRule, fg: v.white, bold: true
v.hi :markdownLinkText, fg: v.color, underline: true

# Notes.
v.hi :Todo, fg: v.black, bg: v.contrast, bold: true

# Popup menu.
v.hi :Pmenu, fg: v.white, bg: v.color
v.hi :PmenuSel, fg: v.color, bg: v.white

# Help.
v.hi :helpSpecial
v.hi :helpHyperTextJump, fg: v.color, underline: true
v.hi :helpNote # linked to Todo

# Vim script.
v.hi :vimOption
v.hi :vimGroup
v.hi :vimHiClear
v.hi :vimHiGroup
v.hi :vimHiAttrib
v.hi :vimHiGui
v.hi :vimHiGuiFgBg
v.hi :vimHiCTerm
v.hi :vimHiCTermFgBg
v.hi :vimSynType
v.hi :vimCommentTitle, fg: v.cgray


