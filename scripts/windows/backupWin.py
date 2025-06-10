import os
import shutil
import filecmp
import json
import argparse
import glob

# --- Hardcoded backup configurations ---

USER_CONFIG = {
    "folders": [
        (".ssh/", True),
        (".vim/", True),
#        (".vscode/", True),
        (".matplotlib/", True),
        ("AppData/Roaming/Code/User/snippets/", True),  # VS Code snippets
    ],
    "files": [
        ".gitconfig",
        ".pypirc",
        "_matplotlibrc",
        "AppData/Rowming/AstroGrep/*.config",
        "AppData/Roaming/Code/User/*.json",
        "AppData/Roaming/Paraview/*.json",
        "AppData/Roaming/vlc/*.ini",  
        "AppData/Local/Google/Chrome/User Data/Default/Preferences",   # Chrome preferences
        "AppData/Local/Google/Chrome/User Data/Default/Bookmarks", 
        "AppData/Local/Google/Chrome/User Data/Default/Shortcuts", 
        "AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/All.ahk",
        "Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1",
    ],
    "backup_env_vars": True,
    "root": "C:/Users/ebranlard",
    "dest": "D:/_backups/Work-Config/User/"
}

SYSTEM_CONFIG = {
    "folders": [
        ("C:/Config/", True),
        ("C:/Bin/", False),
    ],
    "files": [
        # Exported registry file (example, you must export it manually or via script)
        #"C:/Config/WindowsConfigBackup.reg",
        "C:/Bin/ConEmu/ConEmu.xml",
        "C:/Bin/WinMerge/WinMerge.ini",
        "C:/Bin/Vim/_vimrc/",
        "C:/Bin/Inkscape/share/inkscape/palettes/*MANU*.gpl"
    ],
    "backup_env_vars": False,
    "root": "C:/",
    "dest": "D:/_backups/Work-Config/System/",
}
CONFIGS = [USER_CONFIG, SYSTEM_CONFIG]

# --- Helper functions ---

def mirror_folder(src, dst, dry_run=False):
    if not os.path.exists(src):
        print(f"[SKIP] Source folder does not exist: {src}")
        return
    if not os.path.exists(dst):
        if dry_run:
            print(f"[MKDIR] {dst}")
        else:
            os.makedirs(dst)
    for item in os.listdir(src):
        s = os.path.join(src, item)
        d = os.path.join(dst, item)
        if os.path.isdir(s):
            mirror_folder(s, d, dry_run=dry_run)
        else:
            if not os.path.exists(d) or not filecmp.cmp(s, d, shallow=False):
                if dry_run:
                    pass
                    #print(f"[COPY] {s} -> {d}")
                else:
                    shutil.copy2(s, d)
    # Delete files in dst not in src
    if os.path.exists(dst):
        for item in os.listdir(dst):
            d = os.path.join(dst, item)
            s = os.path.join(src, item)
            if not os.path.exists(s):
                if dry_run:
                    print(f"[DELETE] {d}")
                else:
                    if os.path.isdir(d):
                        shutil.rmtree(d)
                    else:
                        os.remove(d)
    else:
        if not dry_run:
            print(f"[SKIP] Destination folder does not exist: {dst}")

def copy_folder_content(src, dst, dry_run=False):
    if not os.path.exists(src):
        print(f"[SKIP] Source folder does not exist: {src}")
        return
    if not os.path.exists(dst):
        if dry_run:
            print(f"[MKDIR] {dst}")
        else:
            os.makedirs(dst)
    for item in os.listdir(src):
        s = os.path.join(src, item)
        d = os.path.join(dst, item)
        if os.path.isfile(s):
            if dry_run:
                pass
                #print(f"[COPY] {s} -> {d}")
            else:
                shutil.copy2(s, d)

def copy_file(src, dst, dry_run=False):
    if not os.path.exists(src):
        print(f"[SKIP] Source file does not exist: {src}")
        return
    dst_folder = os.path.dirname(dst)
    if not os.path.exists(dst_folder):
        if dry_run:
            print(f"[MKDIR] {dst_folder}")
        else:
            os.makedirs(dst_folder)
    if dry_run:
        print(f"[COPY] {src} -> {dst}")
    else:
        shutil.copy2(src, dst)

def restore_file(src, dst, force=False, dry_run=False):
    if not os.path.exists(src):
        print(f"[SKIP] Backup file does not exist: {src}")
        return
    if os.path.exists(dst) and not force:
        print(f"[MANUAL] File exists, manual intervention needed: {dst}")
    else:
        copy_file(src, dst, dry_run=dry_run)

def backup_env_vars(output_file, dry_run=False):
    if dry_run:
        print(f"[ENV] Would backup environment variables to: {output_file}")
    else:
        env_vars = dict(os.environ)
        with open(output_file, 'w') as f:
            json.dump(env_vars, f, indent=2)

# --- Main logic ---

def do_backup_with_config(config, dry_run=False):
    root = config['root']
    dest = config['dest']

    for folder, include_subfolders in config.get("folders", []):
        # If folder is absolute, make it relative to root
        folder_rel = os.path.relpath(folder, root) if os.path.isabs(folder) else folder
        src = os.path.join(root, folder_rel)
        dst = os.path.join(dest, folder_rel)
        print(f"[INFO] Backing {src} > {dst}")
        if include_subfolders:
            mirror_folder(src, dst, dry_run=dry_run)
        else:
            copy_folder_content(src, dst, dry_run=dry_run)
    for file_pattern in config.get("files", []):
        # If file_pattern is absolute, make it relative to root
        file_pattern_rel = os.path.relpath(file_pattern, root) if os.path.isabs(file_pattern) else file_pattern
        if "*" in file_pattern_rel:
            pattern = os.path.join(root, file_pattern_rel)
            for src in glob.glob(pattern):
                rel_path = os.path.relpath(src, root)
                dst = os.path.join(dest, rel_path)
                print(f"[INFO] Backing {src} > {dst}")
                copy_file(src, dst, dry_run=dry_run)
        else:
            src = os.path.join(root, file_pattern_rel)
            dst = os.path.join(dest, file_pattern_rel)
            print(f"[INFO] Backing {src} > {dst}")
            copy_file(src, dst, dry_run=dry_run)
    if config.get("backup_env_vars"):
        backup_env_vars(os.path.join(dest, "env_vars.json"), dry_run=dry_run)
    print("Backup complete." if not dry_run else "Dry run complete.")

def do_restore_with_config(config, force=False, dry_run=False):
    root = config['root']
    dest = config['dest']
    for folder, include_subfolders in config.get("folders", []):
        folder_rel = os.path.relpath(folder, root) if os.path.isabs(folder) else folder
        src = os.path.join(dest, folder_rel)
        dst = os.path.join(root, folder_rel)
        if include_subfolders:
            mirror_folder(src, dst, dry_run=dry_run)
        else:
            copy_folder_content(src, dst, dry_run=dry_run)
    for file_pattern in config.get("files", []):
        file_pattern_rel = os.path.relpath(file_pattern, root) if os.path.isabs(file_pattern) else file_pattern
        if "*" in file_pattern_rel:
            pattern = os.path.join(dest, file_pattern_rel)
            for src in glob.glob(pattern):
                rel_path = os.path.relpath(src, dest)
                dst = os.path.join(root, rel_path)
                restore_file(src, dst, force=force, dry_run=dry_run)
        else:
            src = os.path.join(dest, file_pattern_rel)
            dst = os.path.join(root, file_pattern_rel)
            restore_file(src, dst, force=force, dry_run=dry_run)
    print("Restore complete." if not dry_run else "Dry run complete.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Backup or restore Windows config files.")
    parser.add_argument("mode", nargs="?", choices=["backup", "restore"], default="backup", help="Mode: backup or restore (default: backup)")
    parser.add_argument("-f","--force", action="store_true", help="Force overwrite during restore")
    parser.add_argument("--dry-run", action="store_true", help="Show what would be done without making changes")
    args = parser.parse_args()

    if args.mode == "backup":
        for config in CONFIGS:
            do_backup_with_config(config, dry_run=args.dry_run)
    elif args.mode == "restore":
        for config in CONFIGS:
            do_restore_with_config(config, force=args.force, dry_run=args.dry_run)
