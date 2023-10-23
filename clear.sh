#!/bin/sh

RED='\E[1;31m'      # 红
GREEN='\E[1;32m'    # 绿
YELLOW='\E[1;33m'    # 黄
BLUE='\E[1;34m'     # 蓝
PINK='\E[1;35m'     # 粉红
RES='\E[0m'         # 清除颜色

function log_warnning_msg() {
    echo -e "${YELLOW}[ WARNING ]${RES}" "$@" 
}

log_warnning_msg "For security reasons, this script will not clean up the library file directory. Please manually delete the library that needs to be rebuilt!"
rm -rf bin build