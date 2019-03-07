scriptencoding utf-8

let s:V = vital#zenrei#new()
let s:HTTP = s:V.import('Web.HTTP')
let s:JSON = s:V.import('Web.JSON')

let s:url = 'https://zenrei.nyamikan.net/v1'

function! zenrei#Suggest(word)
  setlocal shortmess+=T
  let content = s:HTTP.get(s:url . '/suggest?q=' . a:word)
  if content.content =~ '^null'
    echo 'No suggestions found'
    return
  endif

  let json = s:JSON.decode(content.content)

  let i = 0
  let output = 'Suggest: '

  for item in json
    let output = output . item['Name'] . '(' . item['Count'] . ') '
    let i = i + 1
    if i >= 10
      break
    endif
  endfor

  exe "norm :echomsg output\n"
endfunction

function! zenrei#Synonym(word)
  let content = s:HTTP.get(s:url . '/synonym?q=' . a:word)
  if content.content =~ '^null'
    echo 'No synonyms found'
    return
  endif

  let json = s:JSON.decode(content.content)
  let synsets = {}
  for item in json
    let key = item['Synset']
    if !has_key(synsets, key)
      let synsets[key] = { 'eng': [], 'jpn': [] }
    endif
    call add(synsets[key][item['Lang']], item['Name'])
  endfor

  for key in keys(synsets)
    if synsets[key]['jpn'] != []
      echo join(synsets[key]['eng'], ', ') . ': ' . join(synsets[key]['jpn'], ', ')
    endif
  endfor
endfunction
