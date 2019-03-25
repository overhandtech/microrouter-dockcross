../../microrouter-dockcross/dockcross-linux-mips make clean
../../microrouter-dockcross/dockcross-linux-mips bash -c "cmake -DLWS_WITH_SSL=0 -DLWS_WITH_SHARED=0 -DLWS_HAVE_MALLOC_TRIM=0 -DLWS_WITH_ZIP_FOPS=0 -DLWS_WITH_ZLIB=0 -DLWS_WITHOUT_EXTENSIONS=1 -DCMAKE_BUILD_TYPE=DEBUG"
../../microrouter-dockcross/dockcross-linux-mips make
