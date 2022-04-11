#### expand.sh

 Increase the choosen partition size to take 100% of the unallocated space

> /!\ this script only works if the selected partition is at the end of the disk otherwise it could brake your partition table /!\


usage:
```
 usage: ./expand.sh [disk]     [partition]
 eg:    ./expand.sh /dev/loop0  /dev/loop0p2
```
