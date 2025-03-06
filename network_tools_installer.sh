#!/bin/bash

# 网络工具安装脚本
# 整合了多种网络工具的安装命令

# 设置颜色
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
PLAIN="\033[0m"

# 清屏函数
clear_screen() {
    clear
}

# 显示菜单
show_menu() {
    echo -e "${GREEN}=== 网络工具安装脚本 ===${PLAIN}"
    echo -e "${YELLOW}1.${PLAIN} 安装 sing-box"
    echo -e "${YELLOW}2.${PLAIN} 安装 3x-ui"
    echo -e "${YELLOW}3.${PLAIN} 安装 hysteria2"
    echo -e "${YELLOW}4.${PLAIN} 安装 trojan-go"
    echo -e "${YELLOW}5.${PLAIN} 安装 snell"
    echo -e "${YELLOW}6.${PLAIN} 安装 warp"
    echo -e "${YELLOW}7.${PLAIN} 全部安装"
    echo -e "${YELLOW}99.${PLAIN} 安装常用工具"
    echo -e "${YELLOW}0.${PLAIN} 退出脚本"
    echo ""
    read -p "请输入数字 [0-7]: " num
}

# 安装 sing-box
install_singbox() {
    echo -e "${GREEN}开始安装 sing-box...${PLAIN}"
    bash <(wget -qO- https://raw.githubusercontent.com/fscarmen/sing-box/main/sing-box.sh)
    echo -e "${GREEN}sing-box 安装完成${PLAIN}"
    echo ""
    read -p "按回车键返回主菜单" enter
    main
}

# 安装 3x-ui
install_3xui() {
    echo -e "${GREEN}开始安装 3x-ui...${PLAIN}"
    bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)
    echo -e "${GREEN}3x-ui 安装完成${PLAIN}"
    echo ""
    read -p "按回车键返回主菜单" enter
    main
}

# 安装 hysteria2
install_hysteria2() {
    echo -e "${GREEN}开始安装 hysteria2...${PLAIN}"
    wget -N --no-check-certificate https://raw.githubusercontent.com/Misaka-blog/hysteria-install/main/hy2/hysteria.sh && bash hysteria.sh
    echo -e "${GREEN}hysteria2 安装完成${PLAIN}"
    echo ""
    read -p "按回车键返回主菜单" enter
    main
}

# 安装 trojan-go
install_trojango() {
    echo -e "${GREEN}开始安装 trojan-go...${PLAIN}"
    bash <(curl -sSL "https://raw.githubusercontent.com/veip007/hj/main/trojan-go.sh")
    echo -e "${GREEN}trojan-go 安装完成${PLAIN}"
    echo ""
    read -p "按回车键返回主菜单" enter
    main
}

# 安装 snell
install_snell() {
    echo -e "${GREEN}开始安装 snell...${PLAIN}"
    wget -O snell.sh --no-check-certificate https://git.io/Snell.sh && chmod +x snell.sh && ./snell.sh
    echo -e "${GREEN}snell 安装完成${PLAIN}"
    echo ""
    read -p "按回车键返回主菜单" enter
    main
}

# 安装 warp
install_warp() {
    echo -e "${GREEN}开始安装 warp...${PLAIN}"
    wget -N https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh && bash menu.sh
    echo -e "${GREEN}warp 安装完成${PLAIN}"
    echo ""
    read -p "按回车键返回主菜单" enter
    main
}

# 安装所有工具
install_all() {
    install_singbox
    install_3xui
    install_hysteria2
    install_trojango
    install_snell
    install_warp
    echo ""
    read -p "按回车键返回主菜单" enter
    main
}

# 安装常用工具
install_common_tools() {
    echo -e "${GREEN}开始安装常用工具...${PLAIN}"
    # 检查包管理器
    if command -v apt &> /dev/null; then
        apt update
        apt install -y wget curl git nano vim unzip
    elif command -v yum &> /dev/null; then
        yum update
        yum install -y wget curl git nano vim unzip
    elif command -v dnf &> /dev/null; then
        dnf update
        dnf install -y wget curl git nano vim unzip
    elif command -v brew &> /dev/null; then
        brew update
        brew install wget curl git nano vim unzip
    else
        echo -e "${RED}未找到支持的包管理器，请手动安装所需工具${PLAIN}"
    fi
    echo -e "${GREEN}常用工具安装完成${PLAIN}"
    echo ""
    read -p "按回车键返回主菜单" enter
    main
}

# 主程序
main() {
    clear_screen
    show_menu
    
    case "${num}" in
        1) install_singbox ;;  
        2) install_3xui ;;  
        3) install_hysteria2 ;;  
        4) install_trojango ;;  
        5) install_snell ;;  
        6) install_warp ;;  
        7) install_all ;;  
        99) install_common_tools ;;
        0) exit 0 ;;  
        *) echo -e "${RED}请输入正确的数字 [0-7]${PLAIN}" 
           echo ""
           read -p "按回车键返回主菜单" enter
           main ;;
    esac
}

# 执行主程序
main
