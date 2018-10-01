if [[ $(uname) == Darwin ]]
then
    ln -s ${PREFIX}/lib/libomp.dylib ${PREFIX}/lib/libgomp.dylib
fi
