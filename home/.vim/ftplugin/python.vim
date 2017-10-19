set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix
set encoding=utf-8


"python with virtualenv support
"
CurrentPy << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(compile(open(activate_this).read(), '', 'exec'), dict(__file__=activate_this))
EOF

if has('python3') && executable('python3')
    let g:completor_python_binary = 'python3'
endif
