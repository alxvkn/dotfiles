#!/bin/luajit

local ffi = require('ffi')
ffi.cdef[[
struct statvfs {
  unsigned long  f_bsize;    /* Filesystem block size */
  unsigned long  f_frsize;   /* Fragment size */
  /* fsblkcnt_t */ unsigned long     f_blocks;   /* Size of fs in f_frsize units */
  /* fsblkcnt_t */ unsigned long     f_bfree;    /* Number of free blocks */
  /* fsblkcnt_t */ unsigned long     f_bavail;   /* Number of free blocks for unprivileged users */
  /* fsfilcnt_t */ unsigned long     f_files;    /* Number of inodes */
  /* fsfilcnt_t */ unsigned long     f_ffree;    /* Number of free inodes */
  /* fsfilcnt_t */ unsigned long     f_favail;   /* Number of free inodes for unprivileged users */
  unsigned long  f_fsid;     /* Filesystem ID */
  unsigned long  f_flag;     /* Mount flags */
  unsigned long  f_namemax;  /* Maximum filename length */
  int __f_spare[6];
};

int statvfs(const char *restrict path, struct statvfs *restrict buf);
int fstatvfs(int fd, struct statvfs *buf);
]]

local label = os.getenv('LABEL') or 'storage:'
local mountpoint = os.getenv('MOUNTPOINT') or '/'

local stat = ffi.new('struct statvfs')

if ffi.C.statvfs(mountpoint, stat) ~= 0 then
  print(label .. ' error')
  os.exit(1)
end

local free = stat.f_bavail
local total = stat.f_blocks
local used = total - free

local GIBI = 1073741824

-- free = tonumber(free * stat.f_frsize) / GIBI
used = tonumber(used * stat.f_frsize) / GIBI
total = tonumber(total * stat.f_frsize) / GIBI

print(('%s "%s" %.1fG/%.1fG'):format(label, mountpoint, used, total))
