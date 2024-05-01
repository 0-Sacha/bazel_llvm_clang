"""LLVM registry
"""

load("@bazel_utilities//toolchains:registry.bzl", "gen_archives_registry")

LLVM_17_0_6 = {
    "toolchain": "LLVM-ubuntu",
    "version": "17.0.6",
    "version-short": "17",
    "latest": True,
    "details": { "clang_version": "17" },
    "archives": {
        "linux_x86_64": {
            "url": "https://github.com/llvm/llvm-project/releases/download/llvmorg-17.0.6/clang+llvm-17.0.6-x86_64-linux-gnu-ubuntu-22.04.tar.xz",
            "sha256": "884EE67D647D77E58740C1E645649E29AE9E8A6FE87C1376BE0F3A30F3CC9AB3",
            "strip_prefix": "clang+llvm-17.0.6-x86_64-linux-gnu-ubuntu-22.04",
        }
    }
}

LLVM_REGISTRY = gen_archives_registry([
    LLVM_17_0_6
])