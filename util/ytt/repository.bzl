def _ytt_tool_impl(ctx):
    os_build_name = "linux-amd64"
    if ctx.os.name.startswith("mac"):
        os_build_name = "darwin-amd64"
    ctx.download(
        "https://github.com/vmware-tanzu/carvel-ytt/releases/download/%s/ytt-%s" % (ctx.attr.version, os_build_name),
        output = "ytt",
        executable = True,
    )
    ctx.file("BUILD", 'exports_files(["ytt"])')

ytt_tool = repository_rule(
    implementation = _ytt_tool_impl,
    attrs = {
        "version": attr.string(default = "v0.30.0"),
    },
)