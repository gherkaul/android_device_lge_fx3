timestamp="`cat /data/log/.timestamp`"
cat /proc/kmsg >> /data/log/$timestamp.kernel.log

