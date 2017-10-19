# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

export CUDA_HOME=/lib64
export LD_LIBRARY_PATH=/lib64
export VAGRANT_DEFAULT_PROVIDER=virtualbox
