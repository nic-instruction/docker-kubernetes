# Troubleshooting

## Docker Kernel Configuration

You can use this to look for missing kernel modules:

```
curl https://raw.githubusercontent.com/docker/docker/master/contrib/check-config.sh > check-config.sh
bash ./check-config.sh
```

The kernel must be 3.10 or above.

On my example system check (gcloud centos 7 image) the kernel is 3.10 `uname -a` and the script shows the following kernel modules are missing:

```
- CONFIG_RESOURCE_COUNTERS: missing
- CONFIG_SECURITY_APPARMOR: missing
- CONFIG_EXT3_FS: missing
- CONFIG_EXT3_FS_XATTR: missing
- CONFIG_EXT3_FS_POSIX_ACL: missing
- CONFIG_EXT3_FS_SECURITY: missing
    - CONFIG_IPVLAN: missing
    - CONFIG_AUFS_FS: missing
    - /dev/zfs: missing
    - zfs command: missing
    - zpool command: missing
```

* Additional troubleshooting resources: https://docs.docker.com/engine/install/linux-postinstall/#configuring-remote-access-with-daemonjson
