def _expand_template_impl(stamped_file,ctx):
    info_file = ctx.info_file
    in_file = ctx.file.file
    out_file = stamped_file

    expand_template_cmd = "%s %s %s %s" % (
        ctx.executable._expand_template.path,
        info_file.path,
        in_file.path,
        out_file.path,
    )

    ctx.actions.run_shell(
        tools = [ctx.executable._expand_template],
        outputs = [out_file],
        inputs = [in_file,info_file],
        progress_message = "Process stamp ytt on %s" % in_file.short_path,
        command = expand_template_cmd,
    )

def _ytt_run_impl(stamped_file,ctx):
    in_file = stamped_file
    out_ytt_file = ctx.actions.declare_file("%s-ytt.yaml" %ctx.attr.name)

    ytt_cmd = "%s --dangerous-allow-all-symlink-destinations -f '%s'" % (
        ctx.executable._ytt_tool.path,
        in_file.path,
    )

    ctx.actions.run_shell(
        tools = [ctx.executable._ytt_tool],
        outputs = [out_ytt_file],
        inputs = [in_file],
        progress_message = "Process ytt on %s" % in_file.short_path,
        command = "%s > '%s'" % (
            ytt_cmd,
            out_ytt_file.path,
        ),
    )

    return [DefaultInfo(files = depset([out_ytt_file]))]

def _ytt_impl(ctx):
    stamped_file = ctx.actions.declare_file("%s-stamped.yaml" % ctx.attr.name)
    _expand_template_impl(stamped_file,ctx)
    return _ytt_run_impl(stamped_file,ctx)

ytt = rule(
    implementation = _ytt_impl,
    attrs = {
        "file": attr.label(
            mandatory = True,
            allow_single_file = True,
            doc = "File with ytt syntaxe"
        ),
        "_ytt_tool": attr.label(
            executable = True,
            cfg = "host",
            allow_single_file = True,
            default = Label("@ytt_tool//:ytt")
        ),
        "_expand_template": attr.label(
            default=Label("//util/ytt:expand_template"),
            executable=True,
            cfg="host"
        ),
    }
)