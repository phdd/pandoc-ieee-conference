#!/usr/bin/env python2

from pandocfilters import toJSONFilter, Image

import ntpath

def path_leaf(path):
    head, tail = ntpath.split(path)
    return tail or ntpath.basename(head)

def figure_filter(key, value, format, meta):
    if key == "Image":
        file = value[2][0]
        fileName = path_leaf(file)
        value[2][1] += fileName.replace(".svg", "")
        value[0][0] = value[2][1]

        if (format == "latex"):
            value[2][0] = file.replace(".svg", ".pdf")

if __name__ == "__main__":
    toJSONFilter(figure_filter)
