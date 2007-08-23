" Script: blinking_cursor.vim
" Features: Makes the cursor blink in x terms when the user is in insert mode
" Version: 0.1
" Last Change: 24 august 2007
" Maintainer: Bruno Dupuis <lisael à laposte point net>
" License: DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
" Disclaimer: You may have get a full copy of the WTFPL along with this
" program. If not, DO WHAT THE FUCK YOU WANT TO 
" 
" DOC
" ========================================================================
" * Supported os:
"   - Linux/UNIX
" * Install:
"   - copy the archive somewhere in your Vim path (usually
"   /usr/share/vim/addons/plugin if you've got root permissions
"   or ~/.vim/plugin. You can also put anywhere as long as you keep
"   'vimblinkcursor' and 'vimstopblinking' along with blink_cursor.vim.
"   In this case switch it on into Vim with:
"           :so /path/to/the/script/blinking_cursor.vim
"
"   - untar the archive:
"           $ tar -zxvf blinking_cursor.tar.gz
"
"	- Make sure that your terminal isn't set to make the cursor blink (in
"	gnome-terminal : Edit=>Current Profile...). If you want to have the cursor
"	blinking while not using vim, you can add this line in your ~/.bashrc
"	file:
"		    /full/path/to/the/script/vimblinkcursor&
"
"	- If it doesn't work as expected, or if you are not on a i386-arch
"	computer, compile vimblinkcursor and stopblinking sources again:
"	        $ gcc vimblinkcursor.c -o vimblinkcursor
"	        $ gcc vimstopblinking.c -o vimstopblinking
"
"	- If it still does not work properly, please e-mail me
" * TODO:
" 	- let the user set the blinking delays
" 	- let the user switch the script on/off 
" 	- port to windows ( i don't think i can do it myself _got only a 
" 	  uninstalled win95 copy_. If someone can, please e-mail me ) 
" * Thanks
"   - blinking_cursor.vim uses blink.c by Bram Moolenaar (provided with vim in
"   /tools)
 	
" Init
" ==========================================================
"
let s:dir=expand("<sfile>:h")

" Functions
" ==========================================================
" FUNCTION: Blink() Calls ./vimblinkcursor
function! s:Blink()
	exec "silent ! ".s:dir."/vimblinkcursor& >>/dev/null"
    let g:blinks = 1
endfunction
" FUNCTION: StopBlinking()
" vimblinkcursor is a long name for such a little tool, isn't it?
" Actually this is to be sure that i kill the right process since
" I get it by its name. We nedd to call vimstopblinking, because
" the cursor may be off when vimblinkcursor is killed
function! s:StopBlinking()
	exec "silent! ! kill `ps|grep vimblinkcursor|awk '{print $1}'|grep -v grep` && ".s:dir."/vimstopblinking >>/dev/null"
	let g:blinks = 0
endfunction

"make sure while sourcing that the cursor doesn't blink yet
call s:StopBlinking()
redraw!

" Bindings
" ==========================================================
augroup blink
au!
au InsertEnter *  :call s:Blink()
au InsertLeave *  :call s:StopBlinking()
augroup END
