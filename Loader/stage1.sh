# download lastest ubuntu rootfs image
$ wget http://cdimage.ubuntu.com/cdimage/ubuntu-base/releases/18.04/release/ubuntu-base-18.04-base-amd64.tar.gz

# create dir to contain our future container
$ mkdir container

# extract ubuntu rootfs to our future container
$ tar -xf ubuntu-base-18.04-base-amd64.tar.gz -C container 2>/dev/null

# create seperate namespaces for our future container
$ sudo unshare --pid --net --ipc --uts --mount --fork

# mount proc fs for our future container (current /proc won't be accesible after chroot)
$ sudo mount -t proc proc container/proc

# mount /dev/pts for out future container (to allow tty attachment)
$ sudo mount --bind /dev/pts container/dev/pts

# create chroot jail, thus entering our future-present container
$ chroot container



Test:
- Run top in a seperate teminal on host and see if you can find it's pid inside the container
- Do the reverse of the previous test
- Compare mounts between host and container
- Compare ipconfig  between host and container


Other Mitigations:
- capabillities
- cgroups
- seccomp
