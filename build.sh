if [ "$1" = "-all" ]; then
    mkdir module/gf-lib
    cd module/gf-lib
    cmake ../gf
    make
    cd ../..
fi

mkdir build

if [ "$1" = "-clean" ]; then
    cd build
    make clean
    make
    cd ..
fi

cd build
cmake ..
make