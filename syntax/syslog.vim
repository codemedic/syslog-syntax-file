" $Id: syslog.vim,v 1.1 2002/09/17 16:10:00 rhiestan Exp $
" Vim syntax file
" Language:     syslog log file
" Maintainer:   Bob Hiestand <bob@hiestandfamily.org>
" Last Change:  $Date: 2002/09/17 16:10:00 $
" Remark: Add some color to log files produced by sysklogd.

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" syn match     syslogText      /.*$/
syn match       syslogTextDebug / \[debug\] .*$/
syn match       syslogTextInfo  / \[info\] .*$/
syn match       syslogTextNotice        / \[notice\] .*$/
syn match       syslogTextWarn  / \[warn\] .*$/
syn match       syslogTextErr   / \[err\] .*$/
syn match       syslogTextCrit  / \[crit\] .*$/
syn match       syslogHost      /\S\+/  nextgroup=syslogTextDebug,syslogTextInfo,syslogTextNotice,syslogTextWarn,syslogTextErr,syslogTextCrit skipwhite
syn match       syslogDate      /^.\{-}\d\d:\d\d:\d\d\.\d\d\d\d\d\d+\d\d:\d\d/  nextgroup=syslogHost skipwhite

if !exists("did_syslog_syntax_inits")
  let did_syslog_syntax_inits = 1
  hi link syslogDate    Comment
  hi link syslogHost    Comment
"  hi link syslogText   String
  hi link syslogTextDebug       Comment
  hi link syslogTextInfo        Comment
  hi syslogTextNotice ctermbg=none ctermfg=grey
  hi syslogTextWarn   ctermbg=none ctermfg=yellow
  hi syslogTextErr    ctermbg=none ctermfg=red
  hi syslogTextCrit   ctermbg=52 ctermfg=37
endif

let b:current_syntax="syslog"
