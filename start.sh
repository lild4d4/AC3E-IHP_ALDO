#!/bin/bash

export PDK_ROOT=~/Documents/IHP-Open-PDK/
export PDK=ihp-sg13g2
export IHP_XSCHEMRC=~/Documents/IHP-Open-PDK/ihp-sg13g2/libs.tech/xschem/xschemrc
export KLAYOUT_HOME=~/Documents/IHP-Open-PDK/ihp-sg13g2/libs.tech/klayout
export HOME_DIR=$(pwd)

#xschem --rcfile $IHP_XSCHEMRC xschem/ldo/ldo_tb_closeloop.sch