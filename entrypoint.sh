#!/bin/bash
# -*- coding: utf-8, tab-width: 2 -*-


function entrypoint () {
  export LANG{,UAGE}=en_US.UTF-8  # make error messages search engine-friendly
  export SELFPATH="$(readlink -m -- "$BASH_SOURCE"/..)"
  cd -- "$SELFPATH" || return $?
  install_apt_pkgs || return $?

  local LU_REPO="$INPUT_LUA_UTIL_REPO"
  [[ "$LU_REPO" == *://* ]] || LU_REPO="https://github.com/$LU_REPO"
  local LFG='/bin/lua-find-globals'
  wget -O "$LFG" -- "$LU_REPO/raw/master/find_globals.sh" || return $?
  chmod a+x -- "$LFG" || return $?

  cd -- /github/workspace || return $?
  "$LFG" --scan || return $?
}


function install_apt_pkgs () {
  local APT_PARAM=()
  which luac |& grep -qPe '^/' || APT_PARAM+=( $INPUT_LUA_APT_PKG )
  which wget |& grep -qPe '^/' || APT_PARAM+=( wget )
  [ -n "${APT_PARAM[*]}" ] || return 0
  apt-get update || return $?
  apt-get install --assume-yes "${APT_PARAM[@]}" || return $?
}








entrypoint "$@"; exit $?
