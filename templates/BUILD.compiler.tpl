""

package(default_visibility = ["//visibility:public"])


filegroup(
    name = "cpp",
    srcs = ["bin/clang-cpp%{extention}"],
)

filegroup(
    name = "cc",
    srcs = ["bin/clang%{extention}"],
)

filegroup(
    name = "cxx",
    srcs = ["bin/clang++%{extention}"],
)

filegroup(
    name = "cov",
    srcs = ["bin/llvm-cov%{extention}"],
)

filegroup(
    name = "ar",
    srcs = ["bin/llvm-ar%{extention}"],
)

filegroup(
    name = "ld",
    srcs = ["bin/lld%{extention}"],
)

filegroup(
    name = "nm",
    srcs = ["bin/llvm-nm%{extention}"],
)

filegroup(
    name = "objcopy",
    srcs = ["bin/llvm-objcopy%{extention}"],
)

filegroup(
    name = "objdump",
    srcs = ["bin/llvm-objdump%{extention}"],
)

filegroup(
    name = "strip",
    srcs = ["bin/llvm-strip%{extention}"],
)

filegroup(
    name = "as",
    srcs = ["bin/llvm-as%{extention}"],
)

filegroup(
    name = "size",
    srcs = ["bin/llvm-size%{extention}"],
)

filegroup(
    name = "dwp",
    srcs = ["bin/llvm-dwp%{extention}"],
)


filegroup(
    name = "compiler_includes",
    srcs = glob([
        "lib/clang/%{clang_version}/include/*",
        "include/**",
    ]),
)

filegroup(
    name = "compiler_libs",
    srcs = glob([
        "lib/clang/%{clang_version}/lib/x86_64-unknown-linux-gnu/*",
        "lib/*",
    ]),
)

filegroup(
    name = "toolchains_bins",
    srcs = glob([
        "lib/clang/%{clang_version}/bin/*",
        "bin/*%{extention}",
    ]),
)

filegroup(
    name = "compiler_pieces",
    srcs = [
        ":compiler_includes",
        ":compiler_libs",
    ],
)

filegroup(
    name = "compiler_files",
    srcs = [
        ":compiler_pieces",
        ":cpp",
        ":cc",
        ":cxx",
    ],
)

filegroup(
    name = "linker_files",
    srcs = [
        ":compiler_pieces",
        ":cc",
        ":cxx",
        ":ld",
        ":ar",
    ],
)

filegroup(
    name = "coverage_files",
    srcs = [
        ":compiler_pieces",
        ":cc",
        ":cxx",
        ":cov",
        ":ld",
    ],
)

filegroup(
    name = "compiler_components",
    srcs = [
        ":cpp",
        ":cc",
        ":cxx",
        ":cov",
        ":ar",
        ":ld",
        ":nm",
        ":objcopy",
        ":objdump",
        ":strip",
        ":as",
        ":size",
        ":dwp",
    ],
)


filegroup(
    name = "dbg",
    srcs = ["bin/lldb%{extention}"],
)

filegroup(
    name = "compiler_extras",
    srcs = [
        "dbg",
    ],
)
