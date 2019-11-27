#!/usr/bin/python3

import sys
import yaml
import math

def main(path):
    with open(path, "r") as yml:
        print("""<html><body>""")
        y = yaml.safe_load(yml)
        for k in y.keys():
            if "theme" in k:
                c = str(y[k]).upper()
                r, g, b = int(c[0:2], 16), int(c[2:4], 16), int(c[4:6], 16)
                d = math.sqrt(r*r + g*g + b*b)
                if d < 200:
                    print("<div style='background: #{c}; color: white'>{k}: {c}</div>".format(k=k, c=c))
                else:
                    print("<div style='background: #{c}; color: black'>{k}: {c}</div>".format(k=k, c=c))
        print("""</body></html>""")

if __name__ == "__main__":
    main(sys.argv[1])
