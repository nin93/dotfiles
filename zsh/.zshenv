## ============= Zsh Environment ============= ##

# User Defaults: {{{
  export PAGER="less"
  export EDITOR="nvim"

  export SCREEN_CAPTURE_DIR="${HOME}/media/images/screenshots"
# }}} User Defaults

# XDG Defaults: {{{
  export XDG_CACHE_HOME="${HOME}/.local/cache"
  export XDG_DATA_HOME="${HOME}/.local/share"
  export XDG_DATA_DIRS="/usr/local/share:/usr/share"
  export XDG_CONFIG_HOME="${HOME}/.config"
  export XDG_CONFIG_DIRS="/etc/xdg"
# }}} XDG Defaults

# GnuPG Defaults: {{{
  export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
# }}} GnuPG Defaults

# Zsh Defaults: {{{
  export HISTFILE="${ZDOTDIR}/.zhistory"
  export ADOTDIR="${ZDOTDIR}/antigen"
# }}} Zsh Defaults

# Less Defaults: {{{
  export LESSKEY="${XDG_CONFIG_HOME}/less/lesskey"
  export LESSHISTFILE="${XDG_CACHE_HOME}/less/history"
# }}} Less Defaults

# Ruby Defaults: {{{
  export GEM_HOME="${XDG_DATA_HOME}/gem"
  export GEM_SPEC_CACHE="${XDG_CACHE_HOME}/gem"
# }}} Ruby Defaults

# Screen Defaults: {{{
  export SCREENRC="${XDG_CONFIG_HOME}/screen/screenrc"
# }}} Screen Defaults

# Xorg Defaults: {{{
  export XAUTHORITY="${XDG_RUNTIME_DIR}/xauthority"
  #export XINITRC="${XDG_CONFIG_HOME}/X11/xinitrc"
# }}} Xorg Defaults

# Sxhkd Defaults: {{{
  # Faster input
  export SXHKD_SHELL="/bin/sh"
# }}} Sxhkd Defaults

# Fzf Defaults: {{{
  export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!**/.git/**'"
  export FZF_DEFAULT_OPTS="--layout=reverse --inline-info"

  [ -n "${DISPLAY}" ] && {
    source ${HOME}/.config/autostart/load-colors

    export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} \
      --color='border:${XRES_BRIGHT_BLACK},pointer:${XRES_NORMAL_BLUE},header:${XRES_NORMAL_YELLOW}' \
      --color='info:${XRES_NORMAL_GREEN},marker:${XRES_NORMAL_CYAN},spinner:${XRES_NORMAL_MAGENTA}' \
      --color='hl:${XRES_NORMAL_MAGENTA},hl+:${XRES_NORMAL_MAGENTA},prompt:${XRES_NORMAL_BLUE}' \
      --color='bg:${XRES_BACKGROUND},bg+:${XRES_NORMAL_BLACK},preview-bg:${XRES_BACKGROUND}' \
      --color='fg:${XRES_FOREGROUND},fg+:${XRES_NORMAL_WHITE},preview-fg:${XRES_FOREGROUND}'"
  }
# }}} Fzf Defaults

# Lf Defaults: {{{
  LS_STANDARD="no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:\
cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;32"

  LS_ARCHIVES="*.tar=00;31:*.tgz=00;31:*.arc=00;31:*.arj=00;31:*.taz=00;31:\
*.lha=00;31:*.lz4=00;31:*.lzh=00;31:*.lzma=00;31:*.tlz=00;31:*.txz=00;31:\
*.tzo=00;31:*.t7z=00;31:*.zip=00;31:*.z=00;31:*.dz=00;31:*.gz=00;31:\
*.lrz=00;31:*.lz=00;31:*.lzo=00;31:*.xz=00;31:*.zst=00;31:*.tzst=00;31:\
*.bz2=00;31:*.bz=00;31:*.tbz=00;31:*.tbz2=00;31:*.tz=00;31:*.deb=00;31:\
*.rpm=00;31:*.jar=00;31:*.war=00;31:*.ear=00;31:*.sar=00;31:*.rar=00;31:\
*.alz=00;31:*.ace=00;31:*.zoo=00;31:*.cpio=00;31:*.7z=00;31:*.rz=00;31:\
*.cab=00;31:*.wim=00;31:*.swm=00;31:*.dwm=00;31:*.esd=00;31:*.iso=00;31"

  LS_IMAGES="*.jpg=00;35:*.jpeg=00;35:*.mjpg=00;35:*.mjpeg=00;35:*.gif=00;35:*.bmp=00;35:\
*.pbm=00;35:*.pgm=00;35:*.ppm=00;35:*.tga=00;35:*.xbm=00;35:*.xpm=00;35:*.tif=00;35:\
*.tiff=00;35:*.png=00;35:*.svg=00;35:*.svgz=00;35:*.mng=00;35:*.pcx=00;35"

  LS_AUDIO="*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:\
*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36"

  LS_VIDEO="*.mov=00;32:*.mpg=00;32:*.mpeg=00;32:*.m2v=00;32:*.mkv=00;32:\
*.webm=00;32:*.ogm=00;32:*.mp4=00;32:*.m4v=00;32:*.mp4v=00;32:*.vob=00;32:\
*.qt=00;32:*.nuv=00;32:*.wmv=00;32:*.asf=00;32:*.rm=00;32:*.rmvb=00;32:\
*.flc=00;32:*.avi=00;32:*.fli=00;32:*.flv=00;32:*.gl=00;32:*.dl=00;32:\
*.xcf=00;32:*.xwd=00;32:*.yuv=00;32:*.cgm=00;32:*.emf=00;32:*.ogv=00;32:*.ogx=00;32"

  export LS_COLORS="${LS_STANDARD}:${LS_ARCHIVES}:${LS_AUDIO}:${LS_VIDEO}:${LS_IMAGES}"
# }}} Lf Defaults

# Lf Defaults: {{{
  export LF_ICONS="\
tw=:st=:ow=:dt=:di=:\
fi=:ln=:or=:ex=:\
*.desktop=:*.o=:*.torrent=:\
*.c=ﭰ:*.cc=ﭱ:*.h=ﭰ:\
*.hh=ﭱ:*.hpp=ﭱ:*.cpp=ﭱ:\
*.clj=:*.coffee=:*.css=:\
*.d=:*.dart=:*.erl=:\
*.exs=:*.fs=:*.go=:\
*.hs=:*.html=:*.java=:\
*.jl=:*.js=:*.json=:\
*.lua=:*.md=:*.php=:\
*.pl=:*.pro=:*.py=:\
*.cr=:*.rb=:*.rs=:\
*.xml=:*.exe=:*.psd=:\
*.scala=:*.ts=:*.vim=:\
*.vdi=:*.vdk=:\
*.vbox=:*.vbox-prev=:\
*.cfg=:*.conf=:*.ini=:\
*.cmd=:*.ps1=:*.sh=:\
*.bash=:*.zsh=:*.fish=:\
*.tar=:*.tgz=:*.arc=:\
*.arj=:*.taz=:*.lha=:\
*.lz4=:*.lzh=:*.lzma=:\
*.tlz=:*.txz=:*.tzo=:\
*.t7z=:*.zip=:*.z=:\
*.dz=:*.gz=:*.lrz=:\
*.lz=:*.lzo=:*.xz=:\
*.zst=:*.tzst=:*.bz2=:\
*.bz=:*.tbz=:*.tbz2=:\
*.tz=:*.deb=:*.rpm=:\
*.jar=:*.war=:*.ear=:\
*.sar=:*.rar=:*.alz=:\
*.ace=:*.zoo=:*.cpio=:\
*.7z=:*.rz=:*.cab=:\
*.wim=:*.swm=:*.dwm=:\
*.esd=:\
*.jpg=:*.jpeg=:*.mjpg=:\
*.mjpeg=:*.gif=:*.bmp=:\
*.pbm=:*.pgm=:*.ppm=:\
*.tga=:*.xbm=:*.xpm=:\
*.tif=:*.tiff=:*.png=:\
*.svg=:*.svgz=:*.mng=:\
*.pcx=:\
*.mov=:*.mpg=:*.mpeg=:\
*.m2v=:*.mkv=:*.webm=:\
*.ogm=:*.mp4=:*.m4v=:\
*.mp4v=:*.vob=:*.qt=:\
*.nuv=:*.wmv=:*.asf=:\
*.rm=:*.rmvb=:*.flc=:\
*.avi=:*.fli=:*.flv=:\
*.gl=:*.dl=:*.xcf=:\
*.xwd=:*.yuv=:*.cgm=:\
*.emf=:*.ogv=:*.ogx=:\
*.aac=ﭵ:*.au=ﭵ:*.flac=ﭵ:\
*.m4a=ﭵ:*.mid=ﭵ:*.midi=ﭵ:\
*.mka=ﭵ:*.mp3=ﭵ:*.mpc=ﭵ:\
*.ogg=ﭵ:*.ra=ﭵ:*.wav=ﭵ:\
*.oga=ﭵ:*.opus=ﭵ:\
*.spx=:*.xspf=:\
*.key=:*.keys=:\
*.theme=:\
*.pdf=:\
*.nix=:\
*.sav=:*.dsv=:\
*.nds=:*.3ds="
# }}} Lf Defaults

# Path Defaults: {{{
  export PATH="\
/usr/local/bin:\
/usr/local/sbin:\
/usr/local/games:\
/usr/lib/jvm/java-8-oracle/bin:\
/usr/lib/jvm/java-8-oracle/db/bin:\
/usr/lib/jvm/java-8-oracle/jre/bin:\
/usr/bin:\
/usr/sbin:\
/usr/games:\
/bin:\
/sbin:\
/snap/bin:\
/opt/bin:\
/usr/local/go/bin:\
/usr/lib/llvm/10/bin:\
${HOME}/.local/bin:\
${HOME}/bin"
# }}} Path Defaults
