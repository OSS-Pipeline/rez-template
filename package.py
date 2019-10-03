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
    "cmake-3+"
]

variants = [
    ["platform-linux"]
]

tools = [
    "tool_or_command_to_expose"
]

build_system = "cmake"

with scope("config") as config:
    config.build_thread_count = "logical_cores"

uuid = "template-{version}".format(version=str(version))

def commands():
    env.PATH.prepend("{root}/bin")

    # Helper environment variables.
    env.TEMPLATE_BINARY_PATH.set("{root}/bin")
    env.TEMPLATE_INCLUDE_PATH.set("{root}/include")
    env.TEMPLATE_LIBRARY_PATH.set("{root}/lib")
