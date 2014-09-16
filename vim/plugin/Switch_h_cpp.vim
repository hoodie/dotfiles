" xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
" ------------------------------------------------------------------------------------------
" || Switch c++ h and cpp
" || Jia Hongyuan, 2014-03-06. Email: jhy13401192277@gmail.com
" ||
" || Descriptions:
" || This script is designed to switch current vim buffer between c++
" || header and cpp files. You can easily add new file extensions by changing "exts" variable.
" || The current support extions include .cpp, .C, .cc.
" || 
" || Installation:
" || 1. Copy this .vim file into .vim/plugin folder. You can change the logger
" || level, if you want to suppress some redundant output information.
" || 2. Set shortcut in .vimrc. e.g.  nmap ,s :call Switch_h_cpp()<CR>
" ------------------------------------------------------------------------------------------
" xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

" ==========================
" Initialization -----------

" function definition.
if !exists( "g:LAUNCH_ROOT" )
	let g:LAUNCH_ROOT = getcwd()
endif
"echom 'g:LAUNCH_ROOT = ' g:LAUNCH_ROOT
function! Switch_h_cpp()
"*************"
python << EOF


# ==========================
# Python Body --------------
import os, logging, types 
import vim


__version__ = 1.0
__author__ = 'Jia Hongyuan'


print '==> Sourced swithch_h_cpp.vim'

exts = [ 'cpp', 'C', 'cc' ]

# logger
DEBUG = 4
ERROR = 3
WARN  = 2
INFO  = 1
OFF   = 0
GLOBAL_LEVEL = OFF


def logPrint( mes, on=1 ):
	if type(mes)==types.NoneType:
		mes = 'NONE'
	if on<=GLOBAL_LEVEL:
		print '--', mes


def recursive_search( parent, fn ):
	children = os.listdir( parent )
	for chi in children:
		if chi==fn:
			return os.path.abspath( '%s/%s'%(parent, chi) )
		else:
			nextParent = os.path.abspath( '%s/%s'%(parent, chi) )
			st = os.path.isdir(nextParent)
			if st:
				result = recursive_search( nextParent, fn )
				if type(result)!=types.NoneType:
				    return result


def loadFileIntoVim( fn ):
	# load it
	try:
		cmd = 'e %s'% fn
		logPrint( 'cmd: '+cmd, INFO )
		vim.command( cmd )
		return True
	except Exception, e:
		print e
		return False


def tryToSearchAndLoadFile( fn ):
	cwd = vim.eval('g:LAUNCH_ROOT')
	logPrint( 'current woring root:'+cwd, DEBUG )

	logPrint( 'search:'+cwd+', '+fn, DEBUG )
	targetFn = recursive_search( cwd, fn )
	print 'first search:', targetFn 

	# test file
	if type(targetFn)!=types.NoneType:
		return loadFileIntoVim( targetFn )
	else:
		return False


def tryToLoadFile( fn, path ):
	fullName = '%s/%s' % ( path, fn )
	logPrint( 'Try to load:'+fullName, DEBUG )
	if os.path.exists( fullName ):
		return loadFileIntoVim( fullName )
	else:
		return False


def run():
	curbuf_name = vim.current.buffer.name
	logPrint( 'current buf file:'+curbuf_name, DEBUG )
	if curbuf_name=='':
		logPrint( 'Invalid action: try to switch empty file', ERROR )
		return
	
	old_path, old_fn = os.path.split( curbuf_name )
	logPrint( 'Current buffer path: '+old_path )

	tmp_fn, tmp_ext  = old_fn.split( '.' )
	if tmp_ext=='h' :
		# 1. search in current buffer file path
		for e in exts:
			new_fn = '%s.%s'%( tmp_fn, e )
			st = tryToLoadFile( new_fn, old_path )
			if st:
				return True
		# 2. search in LAUNCH_ROOT
		for e in exts:
			new_fn = '%s.%s'%( tmp_fn, e )
			st = tryToSearchAndLoadFile( new_fn )
			if st:
				return True

		return False

	elif tmp_ext in exts:
		new_fn = '%s.h'%( tmp_fn )
		
		# 1. search in current buffer file path
		st = tryToLoadFile( new_fn, old_path )
		if st:
			return True
		
		# 2. search in LAUNCH_ROOT
		tryToSearchAndLoadFile( new_fn )
		if st:
			return True
		
		return False
	else:
		logPrint( ' Unknown extension:'+curbuf_name )
		return False


run()
# END Python Body ----------
# ==========================
EOF
" Here the python code is closed. We can continue writing VimL or python again.
endfunction
