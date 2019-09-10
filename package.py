name = "template"

version = "x.x.x"

authors = [
    "John Doe",
    "Jane Doe"
]

description = \
    """
    Template description
    """

requires = [
    "project-1.2.3"
]

variants = [
    ["platform-linux"]
]

tools = [
    "tool_or_command_to_expose"
]

with scope("config") as config:
    config.build_thread_count = "logical_cores"

#TODO: Use the SHA1 of the archive instead.
uuid = "template-x.x.x"

def commands():
    env.PATH.prepend("{root}/my_path")
