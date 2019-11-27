#!/usr/bin/python3

import os
import shutil
import yaml

def list_files(path):
    return [os.path.join(dp, f) for dp, dn, fn in os.walk(path) for f in fn]

def get_theme():
    with open("theme.yml", "r") as f:
        return { k: v for k, v in yaml.safe_load(f.read()).items() if "base" in k }

def to_locations(path):
    rel_path = os.sep.join(path.split(os.sep)[1:])
    template_path = os.path.join("template", rel_path)
    themed_path = os.path.join("home", rel_path)
    home_path = os.path.join(os.environ["HOME"], rel_path)
    return template_path, themed_path, home_path

def newer_than(path1, path2):
    return os.path.getmtime(path1) > os.path.getmtime(path2)

def extract_template(themed, template, theme):
    with open(themed, "r") as i:
        with open(template, "w") as o:
            contents = i.read()
            for k, v in theme.items():
                contents = contents.replace("#"+v, "##"+k+"##")
                contents = contents.replace("0x"+v, "#x"+k+"##")
            o.write(contents)
    mod_time = os.path.getmtime(themed)
    os.utime(template, (mod_time, mod_time))

def apply_theme(template, themed, theme):
    with open(template, "r") as i:
        with open(themed, "w") as o:
            contents = i.read()
            for k, v in theme.items():
                contents = contents.replace("##"+k+"##", "#"+v)
                contents = contents.replace("#x"+k+"##", "0x"+v)
            o.write(contents)

def main():
    theme = get_theme()

    # Step #1: Take any new files from home/ and extract the colors and place into template/
    for themed_file in list_files("home"):
        template_file, _, _ = to_locations(themed_file)
        if not os.path.exists(template_file):
            print("Extracting template for", themed_file, "...")
            extract_template(themed_file, template_file, theme)

    # Step #2: Take any updated template/ files and apply the current theme to produce new home/ files
    # NOTE: If theme.yml is newer than the template/ file, that counts as updated
    for template_file in list_files("template"):
        _, themed_file, _ = to_locations(template_file)
        if not os.path.exists(themed_file) or newer_than(template_file, themed_file) or newer_than("theme.yml", themed_file):
            print("Applying theme to", template_file, "...")
            apply_theme(template_file, themed_file, theme)

    # Step #3: Compare template/ and ~/.  Take whichever file is newer.  If ~ file doesn't exist, that counts as older.
    for themed_file in list_files("home"):
        template_file, _, home_file = to_locations(themed_file)
        if not os.path.exists(home_file) or newer_than(themed_file, home_file):
            print("Pushing", themed_file, "...")
            shutil.copy2(themed_file, home_file)
        elif newer_than(home_file, themed_file):
            print("Pulling", home_file, "...")
            shutil.copy2(home_file, themed_file)
            print("Extracting template for", themed_file, "...")
            extract_template(themed_file, template_file, theme)

if __name__ == "__main__":
    main()
