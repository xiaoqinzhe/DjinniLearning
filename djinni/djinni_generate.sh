#! /usr/bin/env bash

base_dir="$(dirname $0)/../" # 获取脚本所在目录路径，这里脚本放在 .djinni 文件相同目录下

echo $base_dir

# Djinii 生成的 C++/Java/JNI/Objective-C++ 代码的放置路径
cpp_out="$base_dir/generated-src/cpp"
jni_out="$base_dir/generated-src/jni"
java_out="$base_dir/generated-src/java/com/tencent/HelloWorld"
objc_out="$base_dir/generated-src/objc"

java_package="com.xiao.djinni" # Java 代码的包名
namespace="exam"               # C++ 代码所在命名空间
objc_prefix="HW"                      # 可伶的 Objective-C 只能用前缀来避免命名冲突

jni_class_name_style="NativeFooBar"   # 配置 JNI 类命名风格，统一加个 Native 前缀 (这里 FooBar 只是占位符)
jni_file_name_style="NativeFooBar"    # 同理
# DbxException Choose between a customized C++ exception in Java and java.lang.RuntimeException (the default).
# mFooBar Optional, this adds an "m" in front of Java field names

# 输入的描述文件名
djinni_file="djinni/example.djinni"

# 将各种参数传入并运行，Djinii 还提供了很多其它参数供你定制生产代码的风格，可以自行 --help 查看
deps/djinni/src/run \
    --cpp-out $cpp_out \
    --cpp-namespace $namespace \
    \
    --java-out $java_out \
    --java-package $java_package \
    --jni-out $jni_out \
    --java-cpp-exception DbxException \
    --ident-jni-class $jni_class_name_style \
    --ident-jni-file $jni_file_name_style \
    --ident-java-field  mFooBar \
    \
    --objc-out $objc_out \
    --objc-type-prefix $objc_prefix \
    --objcpp-out $objc_out \
    \
    --idl $djinni_file
