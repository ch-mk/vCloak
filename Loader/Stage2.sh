########## Terminal 1 ##########

# check for intel VT-x extension
egrep -m1 "(svm|vmx)" /proc/cpuinfo

# check if intel VT-x is on
lscpu | grep -i vt-x

# check if kvm module is present
lsmod | grep kvm

# grant read/wrtie access to kvm
sudo setfacl -m u:${USER}:rw /dev/kvm

# get firecracker
./get_fc.sh

# start firecracker
./start_fc

########## Terminal 2 ##########

# downlaod minimal kernel and rootfs
./get_kernel_rootfs.sh

# set running firecracker with downloaded kernel
./set_kernel.sh

# set running firecracker with download rootfs
./set_rootfs.sh

# start firecracker
./start_vm.sh

########## Terminal 2 ##########

# login with:
# user: root
# pass: root


# Test:
# - Run top in a seperate teminal on host and see if you can find it's pid inside the vm
# - Do the reverse of the previous test
# - compare kernel version in host and vm (uname -a)
# - Compare mounts between host and container
# - Compare ipconfig  between host and container

