dir=`pwd`
mkdir custfeed
sed -i "1i src-link external $dir/custfeed" feeds.conf.default

#sed -i '1i src-git pppoex https://github.com/pppoex/openwrt-packages.git' feeds.conf.default
git clone https://github.com/pppoex/openwrt-packages.git pppoex
mv pppoex/luci-app-cpufreq custfeed/
git clone https://github.com/sirpdboy/luci-app-ddns-go.git custfeed/luci-app-ddns-go
git clone https://github.com/QiDream-hub/luci-app-zerotier.git custfeed/luci-app-zerotier


./scripts/feeds update -a
./scripts/feeds install -p external -a
#echo "# CONFIG_ALL_NONSHARED is not set" >> .config
#echo "# CONFIG_ALL_KMODS is not set" >> .config
#echo "# CONFIG_ALL is not set" >> .config
#echo CONFIG_PACKAGE-luci-app-cpufreq=y >> .config
#echo CONFIG_PACKAGE-luci-app-ddns-go=y >> .config
#echo CONFIG_PACKAGE-luci-app-zerotier=y >> .config
make defconfig
make package/luci-app-cpufreq/compile \
    package/luci-app-ddns-go/compile \
    package/luci-app-zerotier/compile \
    -j4
make package/index