#!/usr/bin/env bash
source <(curl -s https://raw.githubusercontent.com/DonLocke/ProxmoxVED/add-allstarlink-script-testing/misc/build.func)
# Copyright (c) 2021-2025 community-scripts ORG
# Author: MickLesk (CanbiZ)
# License: MIT | https://github.com/community-scripts/ProxmoxVE/raw/main/LICENSE
# Source: https://www.wireguard.com/

APP="Alpine-Wireguard"
var_tags="${var_tags:-alpine;vpn}"
var_cpu="${var_cpu:-1}"
var_ram="${var_ram:-256}"
var_disk="${var_disk:-1}"
var_os="${var_os:-alpine}"
var_version="${var_version:-3.21}"
var_unprivileged="${var_unprivileged:-1}"

header_info "$APP"
variables
color
catch_errors

function update_script() {
    msg_info "Updating Alpine Packages"
    $STD apk update
    $STD apk upgrade
    msg_ok "Updated Alpine Packages"

    msg_info "Updating WireGuard"
    $STD apk upgrade wireguard-tools
    msg_ok "Updated WireGuard"
}

start
build_container
description

msg_ok "Completed Successfully!\n"
echo -e "${CREATING}${GN}${APP} setup has been successfully initialized!${CL}"
echo -e "${INFO}${YW} WGDashboard Access it using the following URL:${CL}"
echo -e "${TAB}${GATEWAY}${BGN}http://${IP}:10086${CL}"
