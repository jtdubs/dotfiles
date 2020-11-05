#!/usr/bin/python3

import os
import shutil
import sh
import mimetypes
import yaml

def list_files(path):
    return [os.path.join(dp, f) for dp, dn, fn in os.walk(path) for f in fn]

def get_theme():
    with open("theme.yml", "r") as f:
        return { k: str(v) for k, v in yaml.safe_load(f.read()).items() if "theme" in k }

def to_locations(path):
    rel_path = os.sep.join(path.split(os.sep)[1:])
    template_path = os.path.join("template", rel_path)
    themed_path = os.path.join("home", rel_path)
    home_path = os.path.join(os.environ["HOME"], rel_path)
    return template_path, themed_path, home_path

def newer_than(path1, path2):
    return os.path.getmtime(path1) > os.path.getmtime(path2)

def is_themable(path):
    return sh.file("--brief", "--mime-type", path).startswith("text/")

def extract_template(themed, template, theme):
    shutil._ensure_directory(template)

    if is_themable(themed):
        # print("Extracting template for", themed, "...")
        with open(themed, "r") as i:
            with open(template, "w") as o:
                contents = i.read()
                for k, v in theme.items():
                    contents = contents.replace("#"+v, "##"+k+"##")
                    contents = contents.replace("0x"+v, "#x"+k+"##")
                    contents = contents.replace(v, "#b"+k+"##")
                o.write(contents)
    else:
        # print("Keeping template copy of binary ", themed, "...")
        shutil.copy2(themed, template)

    mod_time = os.path.getmtime(themed)
    os.utime(template, (mod_time, mod_time))

def apply_theme(template, themed, theme):
    shutil._ensure_directory(themed)

    if is_themable(template):
        # print("Applying theme to", template, "...")
        with open(template, "r") as i:
            with open(themed, "w") as o:
                contents = i.read()
                for k, v in theme.items():
                    contents = contents.replace("##"+k+"##", "#"+v)
                    contents = contents.replace("#x"+k+"##", "0x"+v)
                    contents = contents.replace("#b"+k+"##", v)
                o.write(contents)
    else:
        # print("Creating themed copy of binary ", template, "...")
        shutil.copy2(template, themed)

def main():
    theme = get_theme()

    # Step #1: Take any new files from home/ and extract the colors and place into template/
    for themed_file in list_files("home"):
        template_file, _, _ = to_locations(themed_file)
        if not os.path.exists(template_file):
            extract_template(themed_file, template_file, theme)

    # Step #2: Take any updated template/ files and apply the current theme to produce new home/ files
    # NOTE: If theme.yml is newer than the template/ file, that counts as updated
    for template_file in list_files("template"):
        _, themed_file, _ = to_locations(template_file)
        if not os.path.exists(themed_file) or newer_than(template_file, themed_file) or newer_than("theme.yml", themed_file):
            apply_theme(template_file, themed_file, theme)

    # Step #3: Compare template/ and ~/.  Take whichever file is newer.  If ~ file doesn't exist, that counts as older.
    for themed_file in list_files("home"):
        template_file, _, home_file = to_locations(themed_file)
        if not os.path.exists(home_file) or newer_than(themed_file, home_file):
            print("Pushing", themed_file, "...")
            shutil._ensure_directory(home_file)
            shutil.copy2(themed_file, home_file)
        elif newer_than(home_file, themed_file):
            print("Pulling", home_file, "...")
            shutil.copy2(home_file, themed_file)
            shutil._ensure_directory(home_file)
            extract_template(themed_file, template_file, theme)

if __name__ == "__main__":
    main()
