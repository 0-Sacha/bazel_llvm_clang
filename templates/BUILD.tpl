""

load("@bazel_utilities//toolchains:cc_toolchain_config.bzl", "cc_toolchain_config")

package(default_visibility = ["//visibility:public"])

cc_toolchain_config(
    name = "cc_toolchain_config_%{toolchain_id}",
    toolchain_identifier = "%{toolchain_id}",
    host_name = "%{host_name}",
    target_name = "%{target_name}",
    target_cpu = "%{target_cpu}",
    compiler = {
        "name": "clang",
        "cc": "clang",
        "cxx": "clang++",
        "cov": "llvm-cov",
        "ar": "llvm-ar",
        "strip": "llvm-strip",
        "size": "llvm-size",
        "nm": "llvm-nm",
        "as": "llvm-as",
        "objcopy": "llvm-objcopy",
        "objdump": "llvm-objdump",
    },
    toolchain_bins = "%{compiler_package}:compiler_components",
    flags = %{flags_packed},
    cxx_builtin_include_directories = [
        "%{compiler_package_path}lib/clang/%{clang_version}/include",
        "%{compiler_package_path}include",
    ],

    copts = %{copts},
    conlyopts = %{conlyopts},
    cxxopts = %{cxxopts},
    linkopts = %{linkopts},
    defines = %{defines},
    includedirs = [
        "%{compiler_package_path}lib/clang/%{clang_version}/include",
        "%{compiler_package_path}include",
    ] + %{includedirs},
    linkdirs = [
        "%{compiler_package_path}lib/clang/%{clang_version}/lib/x86_64-unknown-linux-gnu",
        "%{compiler_package_path}lib",
    ] + %{linkdirs},
    
    toolchain_libs = [],
)

cc_toolchain(
    name = "cc_toolchain_%{toolchain_id}",
    toolchain_identifier = "%{toolchain_id}",
    toolchain_config = ":cc_toolchain_config_%{toolchain_id}",
    
    all_files = "%{compiler_package}:compiler_pieces",
    compiler_files = "%{compiler_package}:compiler_files",
    linker_files = "%{compiler_package}:linker_files",
    ar_files = "%{compiler_package}:ar",
    as_files = "%{compiler_package}:as",
    objcopy_files = "%{compiler_package}:objcopy",
    strip_files = "%{compiler_package}:strip",
    dwp_files = "%{compiler_package}:dwp",
    coverage_files = "%{compiler_package}:coverage_files",
    supports_param_files = 0
)

toolchain(
    name = "toolchain_%{toolchain_id}",
    toolchain = ":cc_toolchain_%{toolchain_id}",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",

    exec_compatible_with = %{exec_compatible_with},
    target_compatible_with = %{target_compatible_with},
)


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
        "lib/clang/%{clang_version}/bin/*%{extention}",
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
