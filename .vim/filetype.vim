" local filetype file
" Loads extra filetypes

if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.ino setfiletype arduino
    au! BufRead,BufNewFile *.clj setfiletype clojure
    au! BufRead,BufNewFile *.cljs setfiletype clojure
augroup END
