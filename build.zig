const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const libz_dep = b.dependency("libz", .{
        .target = target,
        .optimize = optimize,
    });

    const exe = b.addExecutable(.{
        .name = "cpython",
        .target = target,
        .optimize = optimize,
    });
    exe.linkLibrary(libz_dep.artifact("z"));
    exe.linkLibC();

    exe.addIncludePath(b.path("Include/internal"));
    exe.addIncludePath(b.path("."));
    exe.addIncludePath(b.path("Include"));
    exe.rdynamic = true;

    @setEvalBranchQuota(10000);
    exe.addConfigHeader(b.addConfigHeader(.{
        .style = .{ .autoconf = .{ .path = "pyconfig.h.in" } },
        .include_path = "pyconfig.h",
    }, .{
        .ALIGNOF_LONG = 8,
        .ALIGNOF_SIZE_T = 8,
        .DOUBLE_IS_LITTLE_ENDIAN_IEEE754 = 1,
        .ENABLE_IPV6 = 1,
        .HAVE_ACCEPT = 1,
        .HAVE_ACCEPT4 = 1,
        .HAVE_ACOSH = 1,
        .HAVE_ADDRINFO = 1,
        .HAVE_ALARM = 1,
        .HAVE_ALLOCA_H = 1,
        .HAVE_ASINH = 1,
        .HAVE_ASM_TYPES_H = 1,
        .HAVE_ATANH = 1,
        .HAVE_BIND = 1,
        .HAVE_BIND_TEXTDOMAIN_CODESET = 1,
        .HAVE_BUILTIN_ATOMIC = 1,
        .HAVE_CHMOD = 1,
        .HAVE_CHOWN = 1,
        .HAVE_CHROOT = 1,
        .HAVE_CLOCK = 1,
        .HAVE_CLOCK_GETRES = 1,
        .HAVE_CLOCK_GETTIME = 1,
        .HAVE_CLOCK_NANOSLEEP = 1,
        .HAVE_CLOCK_SETTIME = 1,
        .HAVE_CLOSE_RANGE = 1,
        .HAVE_COMPUTED_GOTOS = 1,
        .HAVE_CONFSTR = 1,
        .HAVE_CONNECT = 1,
        .HAVE_COPY_FILE_RANGE = 1,
        .HAVE_CTERMID = 1,
        .HAVE_DECL_RTLD_DEEPBIND = 1,
        .HAVE_DECL_RTLD_GLOBAL = 1,
        .HAVE_DECL_RTLD_LAZY = 1,
        .HAVE_DECL_RTLD_LOCAL = 1,
        .HAVE_DECL_RTLD_MEMBER = 0,
        .HAVE_DECL_RTLD_NODELETE = 1,
        .HAVE_DECL_RTLD_NOLOAD = 1,
        .HAVE_DECL_RTLD_NOW = 1,
        .HAVE_DEVICE_MACROS = 1,
        .HAVE_DEV_PTMX = 1,
        .HAVE_DIRENT_D_TYPE = 1,
        .HAVE_DIRENT_H = 1,
        .HAVE_DIRFD = 1,
        .HAVE_DLFCN_H = 1,
        .HAVE_DLOPEN = 1,
        .HAVE_DUP = 1,
        .HAVE_DUP2 = 1,
        .HAVE_DUP3 = 1,
        .HAVE_DYNAMIC_LOADING = 1,
        .HAVE_ENDIAN_H = 1,
        .HAVE_EPOLL = 1,
        .HAVE_EPOLL_CREATE1 = 1,
        .HAVE_ERF = 1,
        .HAVE_ERFC = 1,
        .HAVE_ERRNO_H = 1,
        .HAVE_EVENTFD = 1,
        .HAVE_EXECV = 1,
        .HAVE_EXPLICIT_BZERO = 1,
        .HAVE_EXPM1 = 1,
        .HAVE_FACCESSAT = 1,
        .HAVE_FCHDIR = 1,
        .HAVE_FCHMOD = 1,
        .HAVE_FCHMODAT = 1,
        .HAVE_FCHOWN = 1,
        .HAVE_FCHOWNAT = 1,
        .HAVE_FCNTL_H = 1,
        .HAVE_FDATASYNC = 1,
        .HAVE_FDOPENDIR = 1,
        .HAVE_FEXECVE = 1,
        .HAVE_FLOCK = 1,
        .HAVE_FORK = 1,
        .HAVE_FORKPTY = 1,
        .HAVE_FPATHCONF = 1,
        .HAVE_FSEEKO = 1,
        .HAVE_FSTATAT = 1,
        .HAVE_FSTATVFS = 1,
        .HAVE_FSYNC = 1,
        .HAVE_FTELLO = 1,
        .HAVE_FTIME = 1,
        .HAVE_FTRUNCATE = 1,
        .HAVE_FUTIMENS = 1,
        .HAVE_FUTIMES = 1,
        .HAVE_FUTIMESAT = 1,
        .HAVE_GAI_STRERROR = 1,
        .HAVE_GCC_ASM_FOR_X64 = 1,
        .HAVE_GCC_ASM_FOR_X87 = 1,
        .HAVE_GCC_UINT128_T = 1,
        .HAVE_GETADDRINFO = 1,
        .HAVE_GETC_UNLOCKED = 1,
        .HAVE_GETEGID = 1,
        .HAVE_GETENTROPY = 1,
        .HAVE_GETEUID = 1,
        .HAVE_GETGID = 1,
        .HAVE_GETGRGID = 1,
        .HAVE_GETGRGID_R = 1,
        .HAVE_GETGRNAM_R = 1,
        .HAVE_GETGROUPLIST = 1,
        .HAVE_GETGROUPS = 1,
        .HAVE_GETHOSTBYADDR = 1,
        .HAVE_GETHOSTBYNAME = 1,
        .HAVE_GETHOSTBYNAME_R = 1,
        .HAVE_GETHOSTBYNAME_R_6_ARG = 1,
        .HAVE_GETHOSTNAME = 1,
        .HAVE_GETITIMER = 1,
        .HAVE_GETLOADAVG = 1,
        .HAVE_GETLOGIN = 1,
        .HAVE_GETNAMEINFO = 1,
        .HAVE_GETPAGESIZE = 1,
        .HAVE_GETPEERNAME = 1,
        .HAVE_GETPGID = 1,
        .HAVE_GETPGRP = 1,
        .HAVE_GETPID = 1,
        .HAVE_GETPPID = 1,
        .HAVE_GETPRIORITY = 1,
        .HAVE_GETPROTOBYNAME = 1,
        .HAVE_GETPWENT = 1,
        .HAVE_GETPWNAM_R = 1,
        .HAVE_GETPWUID = 1,
        .HAVE_GETPWUID_R = 1,
        .HAVE_GETRANDOM = 1,
        .HAVE_GETRANDOM_SYSCALL = 1,
        .HAVE_GETRESGID = 1,
        .HAVE_GETRESUID = 1,
        .HAVE_GETRUSAGE = 1,
        .HAVE_GETSERVBYNAME = 1,
        .HAVE_GETSERVBYPORT = 1,
        .HAVE_GETSID = 1,
        .HAVE_GETSOCKNAME = 1,
        .HAVE_GETSPENT = 1,
        .HAVE_GETSPNAM = 1,
        .HAVE_GETUID = 1,
        .HAVE_GETWD = 1,
        .HAVE_GRP_H = 1,
        .HAVE_HSTRERROR = 1,
        .HAVE_HTOLE64 = 1,
        .HAVE_IF_NAMEINDEX = 1,
        .HAVE_INET_ATON = 1,
        .HAVE_INET_NTOA = 1,
        .HAVE_INET_PTON = 1,
        .HAVE_INITGROUPS = 1,
        .HAVE_INTTYPES_H = 1,
        .HAVE_KILL = 1,
        .HAVE_KILLPG = 1,
        .HAVE_LANGINFO_H = 1,
        .HAVE_LCHOWN = 1,
        .HAVE_LIBDL = 1,
        .HAVE_LIBINTL_H = 1,
        .HAVE_LINK = 1,
        .HAVE_LINKAT = 1,
        .HAVE_LINUX_AUXVEC_H = 1,
        .HAVE_LINUX_CAN_BCM_H = 1,
        .HAVE_LINUX_CAN_H = 1,
        .HAVE_LINUX_CAN_J1939_H = 1,
        .HAVE_LINUX_CAN_RAW_FD_FRAMES = 1,
        .HAVE_LINUX_CAN_RAW_H = 1,
        .HAVE_LINUX_CAN_RAW_JOIN_FILTERS = 1,
        .HAVE_LINUX_MEMFD_H = 1,
        .HAVE_LINUX_NETLINK_H = 1,
        .HAVE_LINUX_QRTR_H = 1,
        .HAVE_LINUX_RANDOM_H = 1,
        .HAVE_LINUX_SOUNDCARD_H = 1,
        .HAVE_LINUX_TIPC_H = 1,
        .HAVE_LINUX_VM_SOCKETS_H = 1,
        .HAVE_LINUX_WAIT_H = 1,
        .HAVE_LISTEN = 1,
        .HAVE_LOCKF = 1,
        .HAVE_LOG1P = 1,
        .HAVE_LOG2 = 1,
        .HAVE_LOGIN_TTY = 1,
        .HAVE_LONG_DOUBLE = 1,
        .HAVE_LSTAT = 1,
        .HAVE_LUTIMES = 1,
        .HAVE_MADVISE = 1,
        .HAVE_MAKEDEV = 1,
        .HAVE_MBRTOWC = 1,
        .HAVE_MEMFD_CREATE = 1,
        .HAVE_MEMRCHR = 1,
        .HAVE_MKDIRAT = 1,
        .HAVE_MKFIFO = 1,
        .HAVE_MKFIFOAT = 1,
        .HAVE_MKNOD = 1,
        .HAVE_MKNODAT = 1,
        .HAVE_MKTIME = 1,
        .HAVE_MMAP = 1,
        .HAVE_MREMAP = 1,
        .HAVE_NANOSLEEP = 1,
        .HAVE_NETDB_H = 1,
        .HAVE_NETINET_IN_H = 1,
        .HAVE_NETPACKET_PACKET_H = 1,
        .HAVE_NET_IF_H = 1,
        .HAVE_NICE = 1,
        .HAVE_OPENAT = 1,
        .HAVE_OPENDIR = 1,
        .HAVE_OPENPTY = 1,
        .HAVE_PATHCONF = 1,
        .HAVE_PAUSE = 1,
        .HAVE_PIPE = 1,
        .HAVE_PIPE2 = 1,
        .HAVE_POLL = 1,
        .HAVE_POLL_H = 1,
        .HAVE_POSIX_FADVISE = 1,
        .HAVE_POSIX_FALLOCATE = 1,
        .HAVE_POSIX_SPAWN = 1,
        .HAVE_POSIX_SPAWNP = 1,
        .HAVE_PREAD = 1,
        .HAVE_PREADV = 1,
        .HAVE_PREADV2 = 1,
        .HAVE_PRLIMIT = 1,
        .HAVE_PROTOTYPES = 1,
        .HAVE_PTHREAD_CONDATTR_SETCLOCK = 1,
        .HAVE_PTHREAD_GETCPUCLOCKID = 1,
        .HAVE_PTHREAD_H = 1,
        .HAVE_PTHREAD_KILL = 1,
        .HAVE_PTHREAD_SIGMASK = 1,
        .HAVE_PTY_H = 1,
        .HAVE_PWRITE = 1,
        .HAVE_PWRITEV = 1,
        .HAVE_PWRITEV2 = 1,
        .HAVE_READLINK = 1,
        .HAVE_READLINKAT = 1,
        .HAVE_READV = 1,
        .HAVE_REALPATH = 1,
        .HAVE_RECVFROM = 1,
        .HAVE_RENAMEAT = 1,
        .HAVE_SCHED_GET_PRIORITY_MAX = 1,
        .HAVE_SCHED_H = 1,
        .HAVE_SCHED_RR_GET_INTERVAL = 1,
        .HAVE_SCHED_SETAFFINITY = 1,
        .HAVE_SCHED_SETPARAM = 1,
        .HAVE_SCHED_SETSCHEDULER = 1,
        .HAVE_SEM_CLOCKWAIT = 1,
        .HAVE_SEM_GETVALUE = 1,
        .HAVE_SEM_OPEN = 1,
        .HAVE_SEM_TIMEDWAIT = 1,
        .HAVE_SEM_UNLINK = 1,
        .HAVE_SENDFILE = 1,
        .HAVE_SENDTO = 1,
        .HAVE_SETEGID = 1,
        .HAVE_SETEUID = 1,
        .HAVE_SETGID = 1,
        .HAVE_SETGROUPS = 1,
        .HAVE_SETHOSTNAME = 1,
        .HAVE_SETITIMER = 1,
        .HAVE_SETJMP_H = 1,
        .HAVE_SETLOCALE = 1,
        .HAVE_SETPGID = 1,
        .HAVE_SETPGRP = 1,
        .HAVE_SETPRIORITY = 1,
        .HAVE_SETREGID = 1,
        .HAVE_SETRESGID = 1,
        .HAVE_SETRESUID = 1,
        .HAVE_SETREUID = 1,
        .HAVE_SETSID = 1,
        .HAVE_SETSOCKOPT = 1,
        .HAVE_SETUID = 1,
        .HAVE_SETVBUF = 1,
        .HAVE_SHADOW_H = 1,
        .HAVE_SHM_OPEN = 1,
        .HAVE_SHM_UNLINK = 1,
        .HAVE_SHUTDOWN = 1,
        .HAVE_SIGACTION = 1,
        .HAVE_SIGALTSTACK = 1,
        .HAVE_SIGFILLSET = 1,
        .HAVE_SIGINFO_T_SI_BAND = 1,
        .HAVE_SIGINTERRUPT = 1,
        .HAVE_SIGNAL_H = 1,
        .HAVE_SIGPENDING = 1,
        .HAVE_SIGRELSE = 1,
        .HAVE_SIGTIMEDWAIT = 1,
        .HAVE_SIGWAIT = 1,
        .HAVE_SIGWAITINFO = 1,
        .HAVE_SNPRINTF = 1,
        .HAVE_SOCKADDR_ALG = 1,
        .HAVE_SOCKADDR_STORAGE = 1,
        .HAVE_SOCKET = 1,
        .HAVE_SOCKETPAIR = 1,
        .HAVE_SPAWN_H = 1,
        .HAVE_SPLICE = 1,
        .HAVE_SSIZE_T = 1,
        .HAVE_STATVFS = 1,
        .HAVE_STAT_TV_NSEC = 1,
        .HAVE_STDARG_PROTOTYPES = 1,
        .HAVE_STDINT_H = 1,
        .HAVE_STDLIB_H = 1,
        .HAVE_STD_ATOMIC = 1,
        .HAVE_STRFTIME = 1,
        .HAVE_STRINGS_H = 1,
        .HAVE_STRING_H = 1,
        .HAVE_STRSIGNAL = 1,
        .HAVE_STRUCT_PASSWD_PW_GECOS = 1,
        .HAVE_STRUCT_PASSWD_PW_PASSWD = 1,
        .HAVE_STRUCT_STAT_ST_BLKSIZE = 1,
        .HAVE_STRUCT_STAT_ST_BLOCKS = 1,
        .HAVE_STRUCT_STAT_ST_RDEV = 1,
        .HAVE_STRUCT_TM_TM_ZONE = 1,
        .HAVE_SYMLINK = 1,
        .HAVE_SYMLINKAT = 1,
        .HAVE_SYNC = 1,
        .HAVE_SYSCONF = 1,
        .HAVE_SYSEXITS_H = 1,
        .HAVE_SYSLOG_H = 1,
        .HAVE_SYSTEM = 1,
        .HAVE_SYS_AUXV_H = 1,
        .HAVE_SYS_EPOLL_H = 1,
        .HAVE_SYS_EVENTFD_H = 1,
        .HAVE_SYS_FILE_H = 1,
        .HAVE_SYS_IOCTL_H = 1,
        .HAVE_SYS_MMAN_H = 1,
        .HAVE_SYS_PARAM_H = 1,
        .HAVE_SYS_POLL_H = 1,
        .HAVE_SYS_RANDOM_H = 1,
        .HAVE_SYS_RESOURCE_H = 1,
        .HAVE_SYS_SELECT_H = 1,
        .HAVE_SYS_SENDFILE_H = 1,
        .HAVE_SYS_SOCKET_H = 1,
        .HAVE_SYS_SOUNDCARD_H = 1,
        .HAVE_SYS_STATVFS_H = 1,
        .HAVE_SYS_STAT_H = 1,
        .HAVE_SYS_SYSCALL_H = 1,
        .HAVE_SYS_SYSMACROS_H = 1,
        .HAVE_SYS_TIMES_H = 1,
        .HAVE_SYS_TIME_H = 1,
        .HAVE_SYS_TYPES_H = 1,
        .HAVE_SYS_UIO_H = 1,
        .HAVE_SYS_UN_H = 1,
        .HAVE_SYS_UTSNAME_H = 1,
        .HAVE_SYS_WAIT_H = 1,
        .HAVE_SYS_XATTR_H = 1,
        .HAVE_TCGETPGRP = 1,
        .HAVE_TCSETPGRP = 1,
        .HAVE_TEMPNAM = 1,
        .HAVE_TERMIOS_H = 1,
        .HAVE_TIMEGM = 1,
        .HAVE_TIMES = 1,
        .HAVE_TMPFILE = 1,
        .HAVE_TMPNAM = 1,
        .HAVE_TMPNAM_R = 1,
        .HAVE_TM_ZONE = 1,
        .HAVE_TRUNCATE = 1,
        .HAVE_TTYNAME = 1,
        .HAVE_UMASK = 1,
        .HAVE_UNAME = 1,
        .HAVE_UNISTD_H = 1,
        .HAVE_UNLINKAT = 1,
        .HAVE_UTIMENSAT = 1,
        .HAVE_UTIMES = 1,
        .HAVE_UTIME_H = 1,
        .HAVE_UTMP_H = 1,
        .HAVE_VFORK = 1,
        .HAVE_WAIT = 1,
        .HAVE_WAIT3 = 1,
        .HAVE_WAIT4 = 1,
        .HAVE_WAITID = 1,
        .HAVE_WAITPID = 1,
        .HAVE_WCHAR_H = 1,
        .HAVE_WCSCOLL = 1,
        .HAVE_WCSFTIME = 1,
        .HAVE_WCSXFRM = 1,
        .HAVE_WMEMCMP = 1,
        .HAVE_WORKING_TZSET = 1,
        .HAVE_WRITEV = 1,
        .MAJOR_IN_SYSMACROS = 1,
        .PTHREAD_KEY_T_IS_COMPATIBLE_WITH_INT = 1,
        .PTHREAD_SYSTEM_SCHED_SUPPORTED = 1,
        .PY_BUILTIN_HASHLIB_HASHES = "md5,sha1,sha256,sha512,sha3,blake2",
        .PY_COERCE_C_LOCALE = 1,
        .PY_FORMAT_SIZE_T = "z",
        .PY_SSL_DEFAULT_CIPHERS = 1,
        .PY_SUPPORT_TIER = 2,
        .RETSIGTYPE = .void,
        .SIZEOF_DOUBLE = 8,
        .SIZEOF_FLOAT = 4,
        .SIZEOF_FPOS_T = 16,
        .SIZEOF_INT = 4,
        .SIZEOF_LONG = 8,
        .SIZEOF_LONG_DOUBLE = 16,
        .SIZEOF_LONG_LONG = 8,
        .SIZEOF_OFF_T = 8,
        .SIZEOF_PID_T = 4,
        .SIZEOF_PTHREAD_KEY_T = 4,
        .SIZEOF_PTHREAD_T = 8,
        .SIZEOF_SHORT = 2,
        .SIZEOF_SIZE_T = 8,
        .SIZEOF_TIME_T = 8,
        .SIZEOF_UINTPTR_T = 8,
        .SIZEOF_VOID_P = 8,
        .SIZEOF_WCHAR_T = 4,
        .SIZEOF__BOOL = 1,
        .STDC_HEADERS = 1,
        .SYS_SELECT_WITH_SYS_TIME = 1,
        .TIME_WITH_SYS_TIME = 1,
        .WITH_DECIMAL_CONTEXTVAR = 1,
        .WITH_DOC_STRINGS = 1,
        .WITH_FREELISTS = 1,
        .WITH_PYMALLOC = 1,
        ._DARWIN_C_SOURCE = 1,
        ._FILE_OFFSET_BITS = 64,
        ._LARGEFILE_SOURCE = 1,
        ._NETBSD_SOURCE = 1,
        ._POSIX_C_SOURCE = .@"200809L",
        ._PYTHONFRAMEWORK = "",
        ._REENTRANT = 1,
        ._XOPEN_SOURCE = 700,
        ._XOPEN_SOURCE_EXTENDED = 1,
        .__BSD_VISIBLE = 1,
        ._ALL_SOURCE = 1,
        ._GNU_SOURCE = 1,
        ._POSIX_PTHREAD_SEMANTICS = 1,
        ._TANDEM_SOURCE = 1,
        .__EXTENSIONS__ = 1,

        .AC_APPLE_UNIVERSAL_BUILD = null,
        .AIX_BUILDDATE = null,
        .AIX_GENUINE_CPLUSPLUS = null,
        .ALT_SOABI = null,
        .ANDROID_API_LEVEL = null,
        .DOUBLE_IS_ARM_MIXED_ENDIAN_IEEE754 = null,
        .DOUBLE_IS_BIG_ENDIAN_IEEE754 = null,
        .FLOAT_WORDS_BIGENDIAN = null,
        .GETPGRP_HAVE_ARG = null,
        .HAVE_ALIGNED_REQUIRED = null,
        .HAVE_ALTZONE = null,
        .HAVE_BLUETOOTH_BLUETOOTH_H = null,
        .HAVE_BLUETOOTH_H = null,
        .HAVE_BROKEN_MBSTOWCS = null,
        .HAVE_BROKEN_NICE = null,
        .HAVE_BROKEN_PIPE_BUF = null,
        .HAVE_BROKEN_POLL = null,
        .HAVE_BROKEN_POSIX_SEMAPHORES = null,
        .HAVE_BROKEN_PTHREAD_SIGMASK = null,
        .HAVE_BROKEN_SEM_GETVALUE = null,
        .HAVE_BROKEN_UNSETENV = null,
        .HAVE_BZLIB_H = null,
        .HAVE_CHFLAGS = null,
        .HAVE_CONIO_H = null,
        .HAVE_CRYPT_H = null,
        .HAVE_CRYPT_R = null,
        .HAVE_CTERMID_R = null,
        .HAVE_CURSES_FILTER = null,
        .HAVE_CURSES_H = null,
        .HAVE_CURSES_HAS_KEY = null,
        .HAVE_CURSES_IMMEDOK = null,
        .HAVE_CURSES_IS_PAD = null,
        .HAVE_CURSES_IS_TERM_RESIZED = null,
        .HAVE_CURSES_RESIZETERM = null,
        .HAVE_CURSES_RESIZE_TERM = null,
        .HAVE_CURSES_SYNCOK = null,
        .HAVE_CURSES_TYPEAHEAD = null,
        .HAVE_CURSES_USE_ENV = null,
        .HAVE_CURSES_WCHGAT = null,
        .HAVE_DB_H = null,
        .HAVE_DECL_TZNAME = null,
        .HAVE_DEV_PTC = null,
        .HAVE_DIRECT_H = null,
        .HAVE_DYLD_SHARED_CACHE_CONTAINS_PATH = null,
        .HAVE_EXPLICIT_MEMSET = null,
        .HAVE_FDWALK = null,
        .HAVE_FORK1 = null,
        .HAVE_FSEEK64 = null,
        .HAVE_FTELL64 = null,
        .HAVE_GCC_ASM_FOR_MC68881 = null,
        .HAVE_GDBM_DASH_NDBM_H = null,
        .HAVE_GDBM_H = null,
        .HAVE_GDBM_NDBM_H = null,
        .HAVE_GETHOSTBYNAME_R_3_ARG = null,
        .HAVE_GETHOSTBYNAME_R_5_ARG = null,
        .HAVE_GLIBC_MEMMOVE_BUG = null,
        .HAVE_IEEEFP_H = null,
        .HAVE_IO_H = null,
        .HAVE_IPA_PURE_CONST_BUG = null,
        .HAVE_KQUEUE = null,
        .HAVE_LARGEFILE_SUPPORT = null,
        .HAVE_LCHFLAGS = null,
        .HAVE_LCHMOD = null,
        .HAVE_LIBB2 = null,
        .HAVE_LIBDB = null,
        .HAVE_LIBDLD = null,
        .HAVE_LIBGDBM_COMPAT = null,
        .HAVE_LIBIEEE = null,
        .HAVE_LIBNDBM = null,
        .HAVE_LIBREADLINE = null,
        .HAVE_LIBRESOLV = null,
        .HAVE_LIBSENDFILE = null,
        .HAVE_LIBSQLITE3 = null,
        .HAVE_LIBUTIL_H = null,
        .HAVE_LZMA_H = null,
        .HAVE_MEMORY_H = null,
        .HAVE_NCURSES_H = null,
        .HAVE_NDBM_H = null,
        .HAVE_NDIR_H = null,
        .HAVE_NETCAN_CAN_H = null,
        .HAVE_NON_UNICODE_WCHAR_T_REPRESENTATION = null,
        .HAVE_PLOCK = null,
        .HAVE_PROCESS_H = null,
        .HAVE_PTHREAD_DESTRUCTOR = null,
        .HAVE_PTHREAD_INIT = null,
        .HAVE_PTHREAD_STUBS = null,
        .HAVE_RL_APPEND_HISTORY = null,
        .HAVE_RL_CATCH_SIGNAL = null,
        .HAVE_RL_COMPLETION_APPEND_CHARACTER = null,
        .HAVE_RL_COMPLETION_DISPLAY_MATCHES_HOOK = null,
        .HAVE_RL_COMPLETION_MATCHES = null,
        .HAVE_RL_COMPLETION_SUPPRESS_APPEND = null,
        .HAVE_RL_PRE_INPUT_HOOK = null,
        .HAVE_RL_RESIZE_TERMINAL = null,
        .HAVE_RPC_RPC_H = null,
        .HAVE_RTPSPAWN = null,
        .HAVE_SOCKADDR_SA_LEN = null,
        .HAVE_STAT_TV_NSEC2 = null,
        .HAVE_STRLCPY = null,
        .HAVE_STROPTS_H = null,
        .HAVE_STRUCT_STAT_ST_BIRTHTIME = null,
        .HAVE_STRUCT_STAT_ST_FLAGS = null,
        .HAVE_STRUCT_STAT_ST_GEN = null,
        .HAVE_SYS_AUDIOIO_H = null,
        .HAVE_SYS_BSDTTY_H = null,
        .HAVE_SYS_DEVPOLL_H = null,
        .HAVE_SYS_DIR_H = null,
        .HAVE_SYS_ENDIAN_H = null,
        .HAVE_SYS_EVENT_H = null,
        .HAVE_SYS_KERN_CONTROL_H = null,
        .HAVE_SYS_LOADAVG_H = null,
        .HAVE_SYS_LOCK_H = null,
        .HAVE_SYS_MEMFD_H = null,
        .HAVE_SYS_MKDEV_H = null,
        .HAVE_SYS_MODEM_H = null,
        .HAVE_SYS_NDIR_H = null,
        .HAVE_SYS_SYS_DOMAIN_H = null,
        .HAVE_SYS_TERMIO_H = null,
        .HAVE_TERM_H = null,
        .HAVE_TZNAME = null,
        .HAVE_USABLE_WCHAR_T = null,
        .HAVE_UTIL_H = null,
        .HAVE_UUID_CREATE = null,
        .HAVE_UUID_ENC_BE = null,
        .HAVE_UUID_GENERATE_TIME_SAFE = null,
        .HAVE_UUID_H = null,
        .HAVE_UUID_UUID_H = null,
        .HAVE_ZLIB_COPY = 1,
        .HAVE_ZLIB_H = 1,
        .HAVE__GETPTY = null,
        .MAJOR_IN_MKDEV = null,
        .MVWDELCH_IS_EXPRESSION = null,
        .PACKAGE_BUGREPORT = null,
        .PACKAGE_NAME = null,
        .PACKAGE_STRING = null,
        .PACKAGE_TARNAME = null,
        .PACKAGE_URL = null,
        .PACKAGE_VERSION = null,
        .POSIX_SEMAPHORES_NOT_ENABLED = null,
        .PYLONG_BITS_IN_DIGIT = null,
        .PY_SQLITE_ENABLE_LOAD_EXTENSION = null,
        .PY_SQLITE_HAVE_SERIALIZE = null,
        .PY_SSL_DEFAULT_CIPHER_STRING = null,
        .Py_DEBUG = null,
        .Py_ENABLE_SHARED = null,
        .Py_HASH_ALGORITHM = null,
        .Py_STATS = null,
        .Py_TRACE_REFS = null,
        .SETPGRP_HAVE_ARG = null,
        .SIGNED_RIGHT_SHIFT_ZERO_FILLS = null,
        .THREAD_STACK_SIZE = null,
        .TIMEMODULE_LIB = null,
        .TM_IN_SYS_TIME = null,
        .USE_COMPUTED_GOTOS = null,
        .WINDOW_HAS_FLAGS = null,
        .WITH_DTRACE = null,
        .WITH_DYLD = null,
        .WITH_EDITLINE = null,
        .WITH_LIBINTL = null,
        .WITH_NEXT_FRAMEWORK = null,
        .WITH_VALGRIND = null,
        .X87_DOUBLE_ROUNDING = null,
        ._BSD_SOURCE = null,
        ._INCLUDE__STDC_A1_SOURCE = null,
        ._LARGE_FILES = null,
        ._MINIX = null,
        ._POSIX_1_SOURCE = null,
        ._POSIX_SOURCE = null,
        ._POSIX_THREADS = null,
        ._WASI_EMULATED_GETPID = null,
        ._WASI_EMULATED_PROCESS_CLOCKS = null,
        ._WASI_EMULATED_SIGNAL = null,
        .clock_t = null,
        .@"const" = null,
        .gid_t = null,
        .mode_t = null,
        .off_t = null,
        .pid_t = null,
        .signed = null,
        .size_t = null,
        .socklen_t = null,
        .uid_t = null,
        .WORDS_BIGENDIAN = null,
    }));

    exe.addCSourceFiles(.{ .files = &.{
        "Modules/_abc.c",
        "Modules/_codecsmodule.c",
        "Modules/_collectionsmodule.c",
        "Modules/_functoolsmodule.c",
        "Modules/_io/_iomodule.c",
        "Modules/_io/bufferedio.c",
        "Modules/_io/bytesio.c",
        "Modules/_io/fileio.c",
        "Modules/_io/iobase.c",
        "Modules/_io/stringio.c",
        "Modules/_io/textio.c",
        "Modules/_localemodule.c",
        "Modules/_operator.c",
        "Modules/_randommodule.c",
        "Modules/_sre/sre.c",
        "Modules/_stat.c",
        "Modules/_struct.c",
        "Modules/_threadmodule.c",
        "Modules/_tracemalloc.c",
        "Modules/_weakref.c",
        "Modules/atexitmodule.c",
        "Modules/binascii.c",
        "Modules/config.c",
        "Modules/errnomodule.c",
        "Modules/faulthandler.c",
        "Modules/gcmodule.c",
        "Modules/getbuildinfo.c",
        "Modules/itertoolsmodule.c",
        "Modules/main.c",
        "Modules/mathmodule.c",
        "Modules/posixmodule.c",
        "Modules/pwdmodule.c",
        "Modules/signalmodule.c",
        "Modules/symtablemodule.c",
        "Modules/timemodule.c",
        "Modules/xxsubtype.c",
        "Modules/zlibmodule.c",
        "Objects/abstract.c",
        "Objects/accu.c",
        "Objects/boolobject.c",
        "Objects/bytearrayobject.c",
        "Objects/bytes_methods.c",
        "Objects/bytesobject.c",
        "Objects/call.c",
        "Objects/capsule.c",
        "Objects/cellobject.c",
        "Objects/classobject.c",
        "Objects/codeobject.c",
        "Objects/complexobject.c",
        "Objects/descrobject.c",
        "Objects/dictobject.c",
        "Objects/enumobject.c",
        "Objects/exceptions.c",
        "Objects/fileobject.c",
        "Objects/floatobject.c",
        "Objects/frameobject.c",
        "Objects/funcobject.c",
        "Objects/genericaliasobject.c",
        "Objects/genobject.c",
        "Objects/interpreteridobject.c",
        "Objects/iterobject.c",
        "Objects/listobject.c",
        "Objects/longobject.c",
        "Objects/memoryobject.c",
        "Objects/methodobject.c",
        "Objects/moduleobject.c",
        "Objects/namespaceobject.c",
        "Objects/object.c",
        "Objects/obmalloc.c",
        "Objects/odictobject.c",
        "Objects/picklebufobject.c",
        "Objects/rangeobject.c",
        "Objects/setobject.c",
        "Objects/sliceobject.c",
        "Objects/structseq.c",
        "Objects/tupleobject.c",
        "Objects/typeobject.c",
        "Objects/unicodectype.c",
        "Objects/unicodeobject.c",
        "Objects/unionobject.c",
        "Objects/weakrefobject.c",
        "Parser/action_helpers.c",
        "Parser/myreadline.c",
        "Parser/parser.c",
        "Parser/peg_api.c",
        "Parser/pegen.c",
        "Parser/pegen_errors.c",
        "Parser/string_parser.c",
        "Parser/token.c",
        "Parser/tokenizer.c",
        "Programs/python.c",
        "Python/Python-ast.c",
        "Python/Python-tokenize.c",
        "Python/_warnings.c",
        "Python/asdl.c",
        "Python/ast.c",
        "Python/ast_opt.c",
        "Python/ast_unparse.c",
        "Python/bltinmodule.c",
        "Python/bootstrap_hash.c",
        "Python/ceval.c",
        "Python/codecs.c",
        "Python/compile.c",
        "Python/context.c",
        "Python/deepfreeze/deepfreeze.c",
        "Python/dtoa.c",
        "Python/dynamic_annotations.c",
        "Python/errors.c",
        "Python/fileutils.c",
        "Python/formatter_unicode.c",
        "Python/frame.c",
        "Python/frozen.c",
        "Python/frozenmain.c",
        "Python/future.c",
        "Python/getargs.c",
        "Python/getcompiler.c",
        "Python/getcopyright.c",
        "Python/getopt.c",
        "Python/getplatform.c",
        "Python/getversion.c",
        "Python/hamt.c",
        "Python/hashtable.c",
        "Python/import.c",
        "Python/importdl.c",
        "Python/initconfig.c",
        "Python/marshal.c",
        "Python/modsupport.c",
        "Python/mysnprintf.c",
        "Python/mystrtoul.c",
        "Python/pathconfig.c",
        "Python/preconfig.c",
        "Python/pyarena.c",
        "Python/pyctype.c",
        "Python/pyfpe.c",
        "Python/pyhash.c",
        "Python/pylifecycle.c",
        "Python/pymath.c",
        "Python/pystate.c",
        "Python/pystrcmp.c",
        "Python/pystrhex.c",
        "Python/pystrtod.c",
        "Python/pythonrun.c",
        "Python/pytime.c",
        "Python/specialize.c",
        "Python/structmember.c",
        "Python/suggestions.c",
        "Python/symtable.c",
        "Python/sysmodule.c",
        "Python/thread.c",
        "Python/traceback.c",
    }, .flags = &.{
        "-fwrapv",
        "-std=c11",
        "-fvisibility=hidden",
        "-DPy_BUILD_CORE",
    } });
    exe.addCSourceFiles(.{ .files = &.{
        "Modules/getpath.c",
    }, .flags = &.{
        "-fwrapv",
        "-std=c11",
        "-fvisibility=hidden",
        "-DPy_BUILD_CORE",

        "-DPYTHONPATH=\"\"",
        "-DPREFIX=\"/usr/local\"",
        "-DEXEC_PREFIX=\"/usr/local\"",
        "-DVERSION=\"3.11\"",
        "-DVPATH=\"\"",
        "-DPLATLIBDIR=\"lib\"",
        "-DPYTHONFRAMEWORK=\"\"",
    } });

    exe.addCSourceFiles(.{ .files = &.{
        "Python/dynload_shlib.c",
    }, .flags = &.{
        "-fwrapv",
        "-std=c11",
        "-fvisibility=hidden",
        "-DPy_BUILD_CORE",

        "-DSOABI=\"cpython-311-x86_64-linux-gnu\"",
    } });

    // This declares intent for the executable to be installed into the
    // standard location when the user invokes the "install" step (the default
    // step when running `zig build`).
    b.installArtifact(exe);

    // This *creates* a Run step in the build graph, to be executed when another
    // step is evaluated that depends on it. The next line below will establish
    // such a dependency.
    const run_cmd = b.addRunArtifact(exe);

    // By making the run step depend on the install step, it will be run from the
    // installation directory rather than directly from within the cache directory.
    // This is not necessary, however, if the application depends on other installed
    // files, this ensures they will be present and in the expected location.
    run_cmd.step.dependOn(b.getInstallStep());

    // This allows the user to pass arguments to the application in the build
    // command itself, like this: `zig build run -- arg1 arg2 etc`
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    // This creates a build step. It will be visible in the `zig build --help` menu,
    // and can be selected like this: `zig build run`
    // This will evaluate the `run` step rather than the default, which is "install".
    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    // Creates a step for unit testing. This only builds the test executable
    // but does not run it.
    const unit_tests = b.addTest(.{
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });

    const run_unit_tests = b.addRunArtifact(unit_tests);

    // Similar to creating the run step earlier, this exposes a `test` step to
    // the `zig build --help` menu, providing a way for the user to request
    // running the unit tests.
    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_unit_tests.step);
}
