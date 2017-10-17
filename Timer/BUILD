package(default_visibility = ["//visibility:public"])

licenses(["notice"])

load(
    "@build_bazel_rules_apple//apple:macos.bzl",
    "macos_application",
)
load(
    "@build_bazel_rules_apple//apple:versioning.bzl",
    "apple_bundle_version",
)

objc_library(
    name = "Sources",
    srcs = glob([
        "**/*.h",
        "**/*.m",
    ]),
    resources = [
        "Base.lproj/Main.storyboard",
    ],
)

apple_bundle_version(
    name = "OneTimerVersion",
    build_version = "1.1.2",
)

macos_application(
    name = "Timer",
    app_icons = [":Assets.xcassets"],
    bundle_id = "com.adamyi.1timer",
    infoplists = [":Info.plist"],
    minimum_os_version = "10.11",
    version = ":OneTimerVersion",
    deps = [":Sources"],
)
