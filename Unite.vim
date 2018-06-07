" Unite Plugin

"" If we have python support builtin then we don't need Unite.
"" use Denite instead.

if !has('python') && !has('python3')
  let g:unite_source_history_yank_enable = 1
  let g:unite_source_history_yank_file=$HOME.'/.cache/yankring.txt'
  let g:unite_data_directory=$HOME.'/.cache/unite'

  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
  nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
  nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
  nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
  nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
  nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

  " Custom mappings for the unite buffer
  autocmd FileType unite call s:unite_settings()
  function! s:unite_settings()
    " Play nice with supertab
    let b:SuperTabDisabled=1
    " Enable navigation with control-j and control-k in insert mode
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
    imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
    imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
    imap <silent><buffer><expr> <C-x> unite#do_action('split')

    "  nmap <buffer> <ESC> <Plug>(unite_exit)
  endfunction

endif
