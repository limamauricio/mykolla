manila type-create default_share_type True

sleep 1

nova flavor-create manila-service-flavor 100 128 0 1

sleep 1

glance image-create --name "manila-service-image" \
--file manila-service-image.qcow2 \
--disk-format qcow2 --container-format bare \
--visibility public --progress

sleep 1

neutron_net_id=$(neutron net-list | grep 'demo-net ' | awk '{print $2}')

sleep 1

neutron_subnet_id=$(neutron net-list | grep 'demo-net ' | awk '{print $6}')

sleep 1

manila share-network-create --name share_network1 --neutron-net-id $neutron_net_id --neutron-subnet-id $neutron_subnet_id

sleep 1

manila create NFS 1 --name share1 --share-network share_network1 --share-type default_share_type

sleep 1

manila list
