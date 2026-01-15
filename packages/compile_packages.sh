sed -i '1i src-git pppoex https://github.com/pppoex/openwrt-packages.git' feeds.conf.default
./scripts/feeds update -a
./scripts/feeds install luci-app-cpufreq
make defconfig
make package/luci-app-cpufreq/compile -j4
