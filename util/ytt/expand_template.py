import sys; 
import re;
import os

def get_map(val_file_lines):
    """
    Return dictionary of key/value pairs from ``val_file_lines`.
    """
    value_map = {}

    for line in val_file_lines:
        v = line.split(' ', 1)
        if len(v) > 1:
            (key, value) = line.split(' ', 1)
            value_map.update(((key, value.rstrip('\n')),))
    return value_map


def expand_template(val_file, in_file, out_file):
    """
    Read each line from ``in_file`` and write it to ``out_file`` replacing all
    ${KEY} references with values from ``val_file``.
    """
    val_file = open(val_file, "r")
    val_file_lines = val_file.readlines()

    def _substitue_variable(mobj):
        return value_map[mobj.group('var')]
    re_pat = re.compile(r'\${(?P<var>[^} ]+)}')
    value_map = get_map(val_file_lines)

    out_file = open(out_file, "w")
    in_file = open(in_file, "r")
    in_file_line = in_file.readlines()
    
    for line in in_file_line:
        out_file.write(re_pat.subn(_substitue_variable, line)[0])

if __name__ == "__main__":
    args = sys.argv[1:]
    expand_template(args[0],args[1],args[2])
