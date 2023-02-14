ExternalProject_Add(ffmpeg
    DEPENDS
        amf-headers
        nvcodec-headers
        bzip2
        lame
        libssh
        libsrt
        libass
        libmodplug
        libpng
        libsoxr
        libbs2b
        libvpx
        libwebp
        libzimg
        libmysofa
        opus
        speex
        vorbis
        libxml2
        libvpl
        libopenmpt
        libjxl
        aom
        dav1d
        uavs3d
    GIT_REPOSITORY https://github.com/FFmpeg/FFmpeg.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--filter=tree:0"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${EXEC} <SOURCE_DIR>/configure
        --cross-prefix=${TARGET_ARCH}-
        --prefix=${MINGW_INSTALL_PREFIX}
        --arch=${TARGET_CPU}
        --target-os=mingw32
        --target-exec=wine
        --pkg-config-flags=--static
        --enable-cross-compile
        --enable-runtime-cpudetect
        --enable-postproc
        --enable-libass
        --enable-libfreetype
        --enable-libfribidi
        --enable-libmodplug
        --enable-libopenmpt
        --enable-libmp3lame
        --enable-libopus
        --enable-libsoxr
        --enable-libspeex
        --enable-libvorbis
        --enable-libbs2b
        --enable-libvpx
        --enable-libwebp
        --enable-libaom
        --enable-libuavs3d
        --enable-libzimg
        --enable-libxml2
        --enable-libmysofa
        --enable-libssh
        --enable-libsrt
        --enable-libvpl
        --enable-libjxl
        --enable-libdav1d
        --enable-cuda
        --enable-cuvid
        --enable-nvdec
        --enable-nvenc
        --enable-amf
        --enable-vulkan
        --disable-doc
        --disable-decoder=libaom_av1
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(ffmpeg)
cleanup(ffmpeg install)
