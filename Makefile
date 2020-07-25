# NATIVE
CONFIG=${HOME}/.config

IMP_ZSH_DIR=${ZDOTDIR}
IMP_ZSH_CFG=${IMP_ZSH_DIR}/.zshrc
IMP_ZSH_ENV=${IMP_ZSH_DIR}/.zshenv
IMP_ZSH_AKA=${IMP_ZSH_DIR}/.zalias
IMP_ZSH_LGI=${IMP_ZSH_DIR}/.zlogin
IMP_ZSH_LGO=${IMP_ZSH_DIR}/.zlogout
IMP_ZSH_PRF=${IMP_ZSH_DIR}/.zprofile

IMP_I3WM_DIR=${CONFIG}/i3
IMP_I3WM_CFG=${IMP_I3WM_DIR}/config

IMP_ATTY_DIR=${CONFIG}/alacritty
IMP_ATTY_CFG=${IMP_ATTY_DIR}/alacritty.yml

IMP_CAVA_DIR=${CONFIG}/cava
IMP_CAVA_CFG=${IMP_CAVA_DIR}/config

IMP_VIM_DIR=${CONFIG}/vim
IMP_VIM_CFG=${IMP_VIM_DIR}/vimrc

IMP_NVIM_DIR=${CONFIG}/nvim
IMP_NVIM_CFG=${IMP_NVIM_DIR}/init.vim

IMP_FONT_DIR=${HOME}/.fonts

IMP_X11_DIR=${HOME}/.xrdb
IMP_X11_RES=${HOME}/.Xresources
IMP_X11_DEF=${HOME}/.Xdefaults
IMP_X11_COL=${IMP_X11_DIR}/colors

.PHONY: install import clear

import:
	mkdir -p alacritty
	cp ${IMP_ATTY_CFG} ./alacritty/alacritty.yml
	\
	mkdir -p cava
	cp ${IMP_CAVA_CFG} ./cava/config
	\
	mkdir -p fonts
	cp ${IMP_FONT_DIR}/Terminus*    ./fonts/
	cp ${IMP_FONT_DIR}/ProggyClean* ./fonts/
	\
	mkdir -p i3
	cp ${IMP_I3WM_CFG} ./i3/config
	\
	mkdir -p nvim
	cp ${IMP_NVIM_CFG} ./nvim/init.vim
	\
	mkdir -p vim
	cp ${IMP_VIM_CFG} ./vim/vimrc
	\
	mkdir -p X11/colors
	cp ${IMP_X11_RES}   ./X11/Xresources
	cp ${IMP_X11_DEF}   ./X11/Xdefaults
	cp ${IMP_X11_COL}/* ./X11/colors/
	\
	mkdir -p zsh
	cp ${IMP_ZSH_CFG} ./zsh/zshrc
	cp ${IMP_ZSH_ENV} ./zsh/zshenv
	cp ${IMP_ZSH_AKA} ./zsh/zalias
	cp ${IMP_ZSH_LGI} ./zsh/zlogin
	cp ${IMP_ZSH_LGO} ./zsh/zlogout
	cp ${IMP_ZSH_PRF} ./zsh/zprofile

install:
	mkdir -p ${CONFIG}
	\
	mkdir -p ${IMP_ATTY_DIR}
	cp ./alacritty/alacritty.yml ${IMP_ATTY_CFG}
	\
	mkdir -p ${IMP_CAVA_DIR}
	cp ./cava/config ${IMP_CAVA_CFG}
	\
	mkdir -p ${IMP_FONT_DIR}
	cp ./fonts/Terminus*    ${IMP_FONT_DIR}/
	cp ./fonts/ProggyClean* ${IMP_FONT_DIR}/
	\
	mkdir -p ${IMP_I3WM_DIR}
	cp ./i3/config ${IMP_I3WM_CFG}
	\
	mkdir -p ${IMP_NVIM_DIR}
	cp ./nvim/init.vim ${IMP_NVIM_CFG}
	\
	mkdir -p ${IMP_VIM_DIR}
	cp ./vim/vimrc ${IMP_VIM_CFG}
	\
	mkdir -p ${IMP_X11_DIR}/colors
	cp ./X11/Xresources ${IMP_X11_RES}
	cp ./X11/Xdefaults  ${IMP_X11_DEF}
	cp ./X11/colors/*   ${IMP_X11_COL}/
	\
	mkdir -p ${IMP_ZSH_DIR}
	cp ./zsh/zshrc    ${IMP_ZSH_CFG}
	cp ./zsh/zshenv   ${IMP_ZSH_ENV}
	cp ./zsh/zalias   ${IMP_ZSH_AKA}
	cp ./zsh/zlogin   ${IMP_ZSH_LGI}
	cp ./zsh/zlogout  ${IMP_ZSH_LGO}
	cp ./zsh/zprofile ${IMP_ZSH_PRF}

clear:
	rm -rf ./alacritty
	rm -rf ./cava
	rm -rf ./fonts
	rm -rf ./i3
	rm -rf ./nvim
	rm -rf ./vim
	rm -rf ./X11
	rm -rf ./zsh

