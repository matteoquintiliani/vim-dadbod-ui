let s:bigquery = {
      \ }

let s:postgres = {
      \ 'Definition': '\df+ {optional_schema}"{function}"',
      \ 'Source': '\sf {optional_schema}"{function}"',
      \ }

let s:sqlite = {
      \ }

let s:mysql = {
      \ 'Source': 'show create function {function}',
      \ }

let s:oracle = {
      \ }

let s:sqlserver = {
\   }

let s:helpers = {
      \ 'bigquery': s:bigquery,
      \ 'postgresql': s:postgres,
      \ 'mysql': s:mysql,
      \ 'oracle': s:oracle,
      \ 'sqlite': s:sqlite,
      \ 'sqlserver': s:sqlserver,
      \ 'mongodb': { },
      \  }

let s:all = {}

for scheme in db#adapter#schemes()
  let s:all[scheme] = get(s:helpers, scheme, {})
endfor

let s:all.postgres = s:all.postgresql
let s:all.sqlite3 = s:all.sqlite

let s:scheme_map = {
      \ 'postgres': 'postgresql',
      \ 'postgresql': 'postgres',
      \ 'sqlite3': 'sqlite',
      \ 'sqlite': 'sqlite3',
      \ }

function! db_ui#function_helpers#get(scheme) abort
  " let result = extend(get(s:all, a:scheme, { 'List': '' }), get(g:db_ui_table_helpers, a:scheme, {}))
  " if has_key(s:scheme_map, a:scheme)
    " let result = extend(result, get(g:db_ui_table_helpers, s:scheme_map[a:scheme], {}))
  " endif

  let result = get(s:all, a:scheme, {})

  return result
endfunction
