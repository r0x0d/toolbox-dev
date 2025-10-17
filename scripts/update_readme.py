import os
import re
import argparse

TOOLBOX_DIR = "toolbox"
REPO_URL = "https://quay.io/repository/toolbox-dev"
README_PATH = "README.md"
START_MARKER = "<!-- START OF AUTOMATIC TABLE GENERATION -->"
END_MARKER = "<!-- END OF AUTOMATIC TABLE GENERATION -->"

def find_containerfiles(root):
    containerfiles = []
    for dirpath, _, filenames in os.walk(root):
        for filename in filenames:
            if filename.endswith(".Containerfile"):
                containerfiles.append(os.path.join(dirpath, filename))
    containerfiles.sort()
    return containerfiles

def get_base_image(containerfile):
    with open(containerfile, "r") as f:
        first_line = f.readline().strip()
    if first_line.startswith("FROM "):
        return first_line[5:]
    return "Unknown"

def get_quay_link(containerfile):
    rel_path = os.path.relpath(containerfile, TOOLBOX_DIR)
    image_path = rel_path.replace('.Containerfile', '')
    image_path = image_path.lstrip('./')
    # Display name: replace '/' with '-' for the markdown link text
    return f"[{image_path}]({REPO_URL}/{image_path})"

def get_purpose(containerfile):
    with open(containerfile, "r") as f:
        for line in f:
            # Match LABEL purpose="..." or LABEL "purpose"="..."
            match = re.match(r'LABEL(?:\s+|\s+")?purpose"?=\"([^"]+)\"', line)
            if match:
                return match.group(1).strip()
    return "No description"

def format_base_image(base):
    if base.startswith("quay.io/toolbox-dev/"):
        image_name = base.replace("quay.io/toolbox-dev/", "")
        return f"[{image_name}]({REPO_URL}/{image_name})"
    elif base.lower().startswith("registry.fedoraproject.org"):
        container_name = base.split("/", 1)
        display_name = container_name[-1].split("-")[0]
        version = container_name[-1].split(":")[-1]
        return f"[{display_name.title()} {version}]({base})"
    else:
        return base

def generate_table():
    containerfiles = find_containerfiles(TOOLBOX_DIR)
    rows = []
    for cf in containerfiles:
        base = get_base_image(cf)
        base_fmt = format_base_image(base)
        quay_link = get_quay_link(cf)
        purpose = get_purpose(cf)
        rows.append((base_fmt, quay_link, purpose))

    rows.sort(key=lambda x: x[1])

    table = []
    table.append("|Base|Where|Purpose|")
    table.append("|---|---|---|")
    for row in rows:
        table.append(f"|{row[0]}|{row[1]}|{row[2]}|")
    return "\n".join(table)

def update_readme(table):
    with open(README_PATH, "r") as f:
        content = f.read()
    pattern = re.compile(
        rf"({START_MARKER})(.*?){END_MARKER}",
        re.DOTALL
    )
    new_content = pattern.sub(
        rf"\1\n\n{table}\n\n{END_MARKER}", content
    )
    with open(README_PATH, "w") as f:
        f.write(new_content)

def main():
    parser = argparse.ArgumentParser(description="Generate toolbox table")
    parser.add_argument("--dry-run", action="store_true", help="Print table to terminal instead of updating README.md")
    args = parser.parse_args()

    table = generate_table()
    if args.dry_run:
        print(table)
    else:
        update_readme(table)
        print("README.md updated.")

if __name__ == "__main__":
    main()