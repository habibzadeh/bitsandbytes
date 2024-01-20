cmake -S . -B "./build_12.1_1" -G "Visual Studio 17 2022" -T "cuda=12.1" -D "NO_CUBLASLT=1"
cmake -S . -B "./build_12.1_0" -G "Visual Studio 17 2022" -T "cuda=12.1" -D "NO_CUBLASLT=0"
cmake --build "./build_12.1_0" --target libbitsandbytes_cuda --config Release
cmake --build "./build_12.1_1" --target libbitsandbytes_cuda --config Release
cmake --build "./build_12.1_0" --target libbitsandbytes_cpu --config Release
python setup.py bdist_egg
cd dist
wheel convert bitsandbytes-0.42.0-py3.9.egg
