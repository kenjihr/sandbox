sudo docker network rm my_net_v6
# ipv6対応ネットワークを作成
sudo docker network create --ipv6 \
	--subnet="2400:4150:8a41:5100:ffff::/80" \
	--gateway="2400:4150:8a41:5100:ffff::1" \
	my_net_v6

# ユニークローカルユニキャストアドレス
#sudo docker network create --ipv6 \
#	--subnet="fdee::/16" \
#	--gateway="fdee::1" \
#	my_net_v6
