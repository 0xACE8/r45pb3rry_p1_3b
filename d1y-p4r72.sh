#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: 0xACE7
#=================================================
#1. Modify default IP
sed -i 's/192.168.1.1/192.168.177.99/g' package/base-files/files/bin/config_generate

#2. Modify Hostname
sed -i "/uci commit system/i\uci set system.@system[0].hostname='RaspberryPi_3B'" package/lean/default-settings/files/zzz-default-settings

#4. Modify builder
sed -i "s/OpenWrt /0xACE7 build $(TZ=UTC-3 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

#5. Change luci list name
sed -i 's/"Argonne 主题设置"/"主题设置"/g' feeds/ace/luci-app-argone-config/po/zh-cn/argone-config.po
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' feeds/luci/applications/luci-app-turboacc/po/zh-cn/turboacc.po

sed -i 's/"#5e72e4"/"#bc1142"/g' feeds/kenzo/luci-theme-argone/htdocs/luci-static/argone/css/cascade.css
sed -i 's/"#5e72e4"/"#bc1142"/g' feeds/ace/luci-theme-argone/htdocs/luci-static/argone/css/cascade.css
sed -i 's/"#483d8b"/"#bc1142"/g' feeds/kenzo/luci-theme-argone/htdocs/luci-static/argone/css/cascade.css
sed -i 's/"#483d8b"/"#bc1142"/g' feeds/ace/luci-theme-argone/htdocs/luci-static/argone/css/cascade.css

rm -rf feeds/ace/luci-theme-argone/htdocs/luci-static/argone/favicon.ico
wget --no-check-certificate -O feeds/ace/luci-theme-argone/htdocs/luci-static/argone/favicon.ico "https://raw.githubusercontent.com/0xACE8/OWT/main/threeb/argone/favicon.ico"
rm -rf feeds/ace/luci-theme-argone/htdocs/luci-static/argone/img/argone.svg
wget --no-check-certificate -O feeds/ace/luci-theme-argone/htdocs/luci-static/argone/img/argone.svg "https://raw.githubusercontent.com/0xACE8/OWT/main/threeb/argone/img/argone.svg"
rm -rf feeds/ace/luci-theme-argone/htdocs/luci-static/argone/img/bg1.jpg
wget --no-check-certificate -O feeds/ace/luci-theme-argone/htdocs/luci-static/argone/img/bg1.jpg "https://raw.githubusercontent.com/0xACE8/OWT/main/threeb/argone/img/bg1.jpg"
rm -rf feeds/ace/luci-theme-argone/htdocs/luci-static/argone/icon/*.png
wget --no-check-certificate -O feeds/ace/luci-theme-argone/htdocs/luci-static/argone/icon/android-icon-192x192.png "https://raw.githubusercontent.com/0xACE8/OWT/main/threeb/argone/icon/android-icon-192x192.png"
wget --no-check-certificate -O feeds/ace/luci-theme-argone/htdocs/luci-static/argone/icon/apple-icon-60x60.png "https://raw.githubusercontent.com/0xACE8/OWT/main/threeb/argone/icon/apple-icon-60x60.png"
wget --no-check-certificate -O feeds/ace/luci-theme-argone/htdocs/luci-static/argone/icon/apple-icon-72x72.png "https://raw.githubusercontent.com/0xACE8/OWT/main/threeb/argone/icon/apple-icon-72x72.png"
wget --no-check-certificate -O feeds/ace/luci-theme-argone/htdocs/luci-static/argone/icon/apple-icon-144x144.png "https://raw.githubusercontent.com/0xACE8/OWT/main/threeb/argone/icon/apple-icon-144x144.png"
wget --no-check-certificate -O feeds/ace/luci-theme-argone/htdocs/luci-static/argone/icon/favicon-16x16.png "https://raw.githubusercontent.com/0xACE8/OWT/main/threeb/argone/icon/favicon-16x16.png"
wget --no-check-certificate -O feeds/ace/luci-theme-argone/htdocs/luci-static/argone/icon/favicon-32x32.png "https://raw.githubusercontent.com/0xACE8/OWT/main/threeb/argone/icon/favicon-32x32.png"
wget --no-check-certificate -O feeds/ace/luci-theme-argone/htdocs/luci-static/argone/icon/favicon-96x96.png "https://raw.githubusercontent.com/0xACE8/OWT/main/threeb/argone/icon/favicon-96x96.png"
wget --no-check-certificate -O feeds/ace/luci-theme-argone/htdocs/luci-static/argone/icon/ms-icon-144x144.png "https://raw.githubusercontent.com/0xACE8/OWT/main/threeb/argone/icon/ms-icon-144x144.png"

#6. Boost UDP
echo '# optimize udp' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.rmem_max=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.rmem_default=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.wmem_max=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.wmem_default=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.netdev_max_backlog=2048' >>package/base-files/files/etc/sysctl.d/10-default.conf

#10. Change to my banner
sudo rm package/base-files/files/etc/banner
wget https://raw.githubusercontent.com/0xACE8/OWT/main/threeb/banner -O package/base-files/files/etc/banner

# dnscrypt-proxy start
sed -i 's/START=18/START=99/g' feeds/packages/net/dnscrypt-proxy2/files/dnscrypt-proxy.init

# DHCP
mkdir -p package/base-files/files/etc/dnsmasq.d
wget --no-check-certificate -O package/base-files/files/etc/dnsmasq.d/accelerated-domains.china.conf "https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/accelerated-domains.china.conf"

# add init settings
wget --no-check-certificate https://raw.githubusercontent.com/0xACE8/r45pb3rry_p1_3b/main/99-init-settings -O package/base-files/files/etc/uci-defaults/99-init-settings

# upgrade 99-default-settings-chinese.sh
rm -rf package/emortal/default-settings/files/99-default-settings-chinese.sh
wget --no-check-certificate https://raw.githubusercontent.com/0xACE8/r45pb3rry_p1_3b/main/zzz-default-settings -O package/lean/default-settings/files/zzz-default-settings

echo "diy-part2.sh is done."
