source ~/.common-shell-env
source ~/.bashrc

export PATH="$HOME/.poetry/bin:$PATH"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

##
# Your previous /Users/eric.coleman/.bash_profile file was backed up as /Users/eric.coleman/.bash_profile.macports-saved_2019-05-03_at_14:49:02
##

# MacPorts Installer addition on 2019-05-03_at_14:49:02: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# Add Mono
export PATH=/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin:/Users/eric.coleman/.asdf/shims:/Users/eric.coleman/.asdf/bin:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/eric.coleman/bin:/Users/eric.coleman/.poetry/bin:/Users/eric.coleman/.fzf/bin:/usr/local/bin:/Users/eric.coleman/bin:/Users/eric.coleman/.poetry/bin:/Library/Frameworks/Mono.framework/Versions/Current/bin
# Add LaTeX
export PATH=$PATH:/usr/local/texlive/2019basic/bin/x86_64-darwin

export PATH="$HOME/.cargo/bin:$PATH"
