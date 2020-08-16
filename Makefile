# NATIVE
CONFIG=${HOME}/.config

IMP_ATTY_DIR=${CONFIG}/alacritty
IMP_ATTY_CFG=${IMP_ATTY_DIR}/alacritty.yml

IMP_BSPWM_DIR=${CONFIG}/bspwm
IMP_BSPWM_CFG=${IMP_BSPWM_DIR}/bspwmrc

IMP_CAVA_DIR=${CONFIG}/cava
IMP_CAVA_CFG=${IMP_CAVA_DIR}/config

IMP_CMP_DIR=${CONFIG}
IMP_CMP_CFG=${IMP_CMP_DIR}/compton.conf

IMP_DST_DIR=${CONFIG}/dunst
IMP_DST_CFG=${IMP_DST_DIR}/dunstrc

IMP_FONT_DIR=${HOME}/.fonts

IMP_I3WM_DIR=${CONFIG}/i3
IMP_I3WM_CFG=${IMP_I3WM_DIR}/config

IMP_LF_DIR=${CONFIG}/lf
IMP_LF_CFG=${IMP_LF_DIR}/lfrc

IMP_NCMP_DIR=${CONFIG}/ncmpcpp
IMP_NCMP_CFG=${IMP_NCMP_DIR}/config

IMP_NVIM_DIR=${CONFIG}/nvim
IMP_NVIM_CFG=${IMP_NVIM_DIR}/init.vim

IMP_MPD_DIR=${CONFIG}/mpd
IMP_MPD_CFG=${IMP_MPD_DIR}/mpd.conf

IMP_PLB_DIR=${CONFIG}/polybar
IMP_PLB_CFG=${IMP_PLB_DIR}/config
IMP_PLB_CMD=${IMP_PLB_DIR}/launch.sh

IMP_ROFI_DIR=${CONFIG}/rofi
IMP_ROFI_CFG=${IMP_ROFI_DIR}/config.rasi
IMP_ROFI_MEN=${IMP_ROFI_DIR}/menu
IMP_ROFI_COL=${IMP_ROFI_DIR}/themes

IMP_SXHK_DIR=${CONFIG}/sxhkd
IMP_SXHK_CFG=${IMP_SXHK_DIR}/sxhkdrc

IMP_VIM_DIR=${CONFIG}/vim
IMP_VIM_CFG=${IMP_VIM_DIR}/vimrc

IMP_X11_DIR=${HOME}/.xrdb
IMP_X11_RES=${HOME}/.Xresources
IMP_X11_DEF=${HOME}/.Xdefaults
IMP_X11_COL=${IMP_X11_DIR}/colors

IMP_ZSH_DIR=${ZDOTDIR}
IMP_ZSH_CFG=${IMP_ZSH_DIR}/.zshrc
IMP_ZSH_ENV=${IMP_ZSH_DIR}/.zshenv
IMP_ZSH_AKA=${IMP_ZSH_DIR}/.zalias
IMP_ZSH_LGI=${IMP_ZSH_DIR}/.zlogin
IMP_ZSH_LGO=${IMP_ZSH_DIR}/.zlogout
IMP_ZSH_PRF=${IMP_ZSH_DIR}/.zprofile
IMP_ZSH_ENV_HOME=${HOME}/.zshenv

.PHONY: install import clear

import:
	mkdir --parents      alacritty
	cp ${IMP_ATTY_CFG} ./alacritty/alacritty.yml
	\
	mkdir --parents       bspwm
	cp ${IMP_BSPWM_CFG} ./bspwm/bspwmrc
	\
	mkdir --parents      cava
	cp ${IMP_CAVA_CFG} ./cava/config
	\
	mkdir --parents     compton
	cp ${IMP_CMP_CFG} ./compton/compton.conf
	\
	mkdir --parents                   fonts
	cp ${IMP_FONT_DIR}/ctrld-fixed* ./fonts/
	cp ${IMP_FONT_DIR}/Terminus*    ./fonts/
	cp ${IMP_FONT_DIR}/ProggyClean* ./fonts/
	\
	mkdir --parents      i3
	cp ${IMP_I3WM_CFG} ./i3/config
	\
	mkdir --parents      lf
	cp ${IMP_LF_CFG}   ./lf/lfrc
	\
	mkdir --parents      ncmpcpp
	cp ${IMP_NCMP_CFG} ./ncmpcpp/config
	cp ${IMP_NCMP_CFG} ./ncmpcpp/config-art-dark
	\
	mkdir --parents      nvim
	cp ${IMP_NVIM_CFG} ./nvim/init.vim
	\
	mkdir --parents     mpd
	cp ${IMP_MPD_CFG} ./mpd/mpd.conf
	\
	mkdir --parents     polybar
	cp ${IMP_PLB_CFG} ./polybar/config
	cp ${IMP_PLB_CMD} ./polybar/launch.sh
	\
	mkdir --parents        rofi/menu
	mkdir --parents        rofi/themes
	cp ${IMP_ROFI_CFG}   ./rofi/config.rasi
	cp ${IMP_ROFI_MEN}/* ./rofi/menu/
	cp ${IMP_ROFI_COL}/* ./rofi/themes/
	\
	mkdir --parents      sxhkd
	cp ${IMP_SXHK_CFG} ./sxhkd/sxhkdrc
	\
	mkdir --parents     vim
	cp ${IMP_VIM_CFG} ./vim/vimrc
	\
	mkdir --parents       X11/colors
	cp ${IMP_X11_RES}   ./X11/Xresources
	cp ${IMP_X11_DEF}   ./X11/Xdefaults
	cp ${IMP_X11_COL}/* ./X11/colors/
	\
	mkdir --parents     zsh
	cp ${IMP_ZSH_CFG} ./zsh/zshrc
	cp ${IMP_ZSH_ENV} ./zsh/zshenv
	cp ${IMP_ZSH_AKA} ./zsh/zalias
	cp ${IMP_ZSH_LGI} ./zsh/zlogin
	cp ${IMP_ZSH_LGO} ./zsh/zlogout
	cp ${IMP_ZSH_PRF} ./zsh/zprofile

install:
	mkdir --parents ${CONFIG}
	\
	mkdir --parents              ${IMP_ATTY_DIR}
	cp ./alacritty/alacritty.yml ${IMP_ATTY_CFG}
	\
	mkdir --parents    ${IMP_BSPWM_DIR}
	cp ./bspwm/bspwmrc ${IMP_BSPWM_CFG}
	\
	cp ./compton/compton.conf ${IMP_CMP_CFG}
	\
	mkdir --parents  ${IMP_CAVA_DIR}
	cp ./cava/config ${IMP_CAVA_CFG}
	\
	mkdir --parents    ${IMP_DST_DIR}
	cp ./dunst/dunstrc ${IMP_DST_CFG}
	\
	mkdir --parents         ${IMP_FONT_DIR}
	cp ./fonts/ctrld-fixed* ${IMP_FONT_DIR}/
	cp ./fonts/Terminus*    ${IMP_FONT_DIR}/
	cp ./fonts/ProggyClean* ${IMP_FONT_DIR}/
	\
	mkdir --parents ${IMP_I3WM_DIR}
	cp ./i3/config  ${IMP_I3WM_CFG}
	\
	mkdir --parents ${IMP_LF_DIR}
	cp ./lf/lfrc    ${IMP_LF_CFG}
	\
	mkdir --parents ${IMP_NCMP_DIR}
	cp ./ncmpcpp/*  ${IMP_NCMP_DIR}/
	\
	mkdir --parents    ${IMP_NVIM_DIR}
	cp ./nvim/init.vim ${IMP_NVIM_CFG}
	\
	mkdir --parents   ${IMP_MPD_DIR}/playlists
	cp ./mpd/mpd.conf ${IMP_MPD_CFG}
	touch ${IMP_MPD_DIR}/{log,pid,database,state}
	\
	mkdir --parents        ${IMP_PLB_DIR}
	cp ./polybar/config    ${IMP_PLB_CFG}
	cp ./polybar/launch.sh ${IMP_PLB_CMD}
	\
	mkdir --parents       ${IMP_ROFI_DIR}/menu
	mkdir --parents       ${IMP_ROFI_DIR}/themes
	cp ./rofi/config.rasi ${IMP_ROFI_CFG}
	cp ./rofi/menu/*      ${IMP_ROFI_MEN}/
	cp ./rofi/themes/*    ${IMP_ROFI_COL}/
	\
	mkdir --parents    ${IMP_SXHK_DIR}
	cp ./sxhkd/sxhkdrc ${IMP_SXHK_CFG}
	\
	mkdir --parents ${IMP_VIM_DIR}
	cp ./vim/vimrc  ${IMP_VIM_CFG}
	\
	mkdir --parents     ${IMP_X11_DIR}/colors
	cp ./X11/Xresources ${IMP_X11_RES}
	cp ./X11/Xdefaults  ${IMP_X11_DEF}
	cp ./X11/colors/*   ${IMP_X11_COL}/
	\
	mkdir --parents   ${IMP_ZSH_DIR}
	cp ./zsh/zshrc    ${IMP_ZSH_CFG}
	cp ./zsh/zshenv   ${IMP_ZSH_ENV}
	cp ./zsh/zalias   ${IMP_ZSH_AKA}
	cp ./zsh/zlogin   ${IMP_ZSH_LGI}
	cp ./zsh/zlogout  ${IMP_ZSH_LGO}
	cp ./zsh/zprofile ${IMP_ZSH_PRF}

clear:
	rm -rf ./alacritty
	rm -rf ./bspwm
	rm -rf ./cava
	rm -rf ./dunst
	rm -rf ./fonts
	rm -rf ./i3
	rm -rf ./lf
	rm -rf ./mpd
	rm -rf ./ncmpcpp
	rm -rf ./nvim
	rm -rf ./polybar
	rm -rf ./rofi
	rm -rf ./sxhkd
	rm -rf ./vim
	rm -rf ./X11
	rm -rf ./zsh

