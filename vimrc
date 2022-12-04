" Get script path
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Source files
execute 'source ' . s:path . '/general'
execute 'source ' . s:path . '/custom_commands'
execute 'source ' . s:path . '/custom_remappings'
execute 'source ' . s:path . '/file_rules'
execute 'source ' . s:path . '/plugins'

" Set colorscheme
colorscheme codedark
