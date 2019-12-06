" Author: anupdhml <anupdhml+git@gmail.com>
" Description: A language server for tremor

call ale#Set('tremor_language_server_executable', 'tremor-language-server')
call ale#Set('tremor_language_server_config', {})

function! ale_linters#trickle#tremor_language_server#GetCommand(buffer) abort
    " TODO will be useful to pass in args to the lang server
    "let l:executable = ale#Var(a:buffer, 'tremor_language_server_executable')
    "return ale#Escape(l:executable)
    return '%e --backend trickle'
endfunction

function! ale_linters#trickle#tremor_language_server#GetProjectRoot(buffer) abort
    return fnamemodify(bufname(a:buffer), ':p:h')
endfunction

call ale#linter#Define('trickle', {
\   'name': 'tremor_language_server',
\   'aliases': ['tremor-language-server'],
\   'lsp': 'stdio',
\   'lsp_config': {b -> ale#Var(b, 'tremor_language_server_config')},
\   'executable': {b -> ale#Var(b, 'tremor_language_server_executable')},
\   'command': function('ale_linters#trickle#tremor_language_server#GetCommand'),
\   'project_root': function('ale_linters#trickle#tremor_language_server#GetProjectRoot'),
\})
