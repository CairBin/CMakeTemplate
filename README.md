# CMakeTemplate

## 描述
CMake项目模板

## 说明

### 目录说明

* `./include` - 头文件目录
* `./lib` - 库文件目录，外部库文件可放这里，同时项目生成的库文件也会放置在这里
* `./src` - 源文件目录
* `./clear.sh` - 清除已经生成的文件 (包括可执行文件、生成的Makefile文件，但不会清除库文件，需手动操作)
* `./run.sh` - 生成并运行 (默认不传递main函数参数)
* `./bin` - 存放可执行文件
* `./LICENSE` - 许可证，默认`Apache License 2.0`，可自行修改

请在项目中对应的`CMakeLists.txt`中添加对应指令以调用外部库。首先查找系统目录，若找不到对应的库，则自动会去`./lib`下寻找，无需拷贝到`./bin`中。

### 添加子项目
在`./src`中添加子项目，并配置CMakeLists.txt文件
例如，在`./src`创建一个`Test2`的模块，请在`./src/CMakeLists.txt`中追加
```CMake
# ./src/CMakeLists
add_subdirectory(Test2)
```
请确保`./src/Test2/CMakeLists.txt`存在，并有大约如下内容，这将生成一个共享库。
```CMake
# ./src/Test2/CMakeLists.txt
project(Test2)

aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR} SRC)
include_directories(${CMAKE_SOURCE_DIR}/include)
add_library(${PROJECT_NAME} SHARED ${SRC})
```

## 编译&运行

* `Linux`或者`OSX`
```shell
sh run.sh
```
若要清理构建的文件(除库文件外)，则可执行
```shell
sh clear.sh
```

* 对于`Windows`
```bat
mkdir build
cd build
cmake ..
make
.\..\bin\app.exe
```