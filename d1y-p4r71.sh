# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#echo 'src-git ace https://github.com/0xACE8/ace-packages' >>feeds.conf.default
#echo 'src-git roacn https://github.com/roacn/openwrt-packages' >>feeds.conf.default

# Add COMFAST CF-812AC (rtl8812bu)
#git clone https://github.com/0xACE8/rtl8812bu.git package/kernel/rtl8812bu

sed -i '1 i\src-git ace https://github.com/0xACE8/4c3-p4ck463' feeds.conf.default
sed -i '2 i\src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main' feeds.conf.default
sed -i '$a src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git;main' feeds.conf.default