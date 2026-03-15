- [Introducing the Linux operating system](#introducing-the-linux-operating-system)
  - [Core Concepts: OS, Kernel, and Unix](#core-concepts-os-kernel-and-unix)
  - [The "Linux" Identity: GNU + Linux](#the-linux-identity-gnu--linux)
  - [Why Linux Matters](#why-linux-matters)
- [Linux Distributions](#linux-distributions)
  - [What is a Linux Distribution](#what-is-a-linux-distribution)
  - [Common Linux distributions](#common-linux-distributions)
- [The Linux filesystem](#the-linux-filesystem)
  - [Important Facts About Filenames](#important-facts-about-filenames)
  - [Directory structure](#directory-structure)
    - [Exploring the Linux filesystem from the command line](#exploring-the-linux-filesystem-from-the-command-line)
  - [Understanding file paths](#understanding-file-paths)
    - [Absolute Paths](#absolute-paths)
    - [Relative Paths](#relative-paths)
  - [Symbolic Links](#symbolic-links)
  - [Hard Links](#hard-links)
  - [Wildcards (File name expansion - Globbing)](#wildcards-file-name-expansion---globbing)
    - [The Asterisk (`*`) Wildcard](#the-asterisk--wildcard)
    - [The Single Character Wildcard (?)](#the-single-character-wildcard-)
    - [Square Brackets (\[\]) and Ranges](#square-brackets--and-ranges)
    - [The Globstar (`**`)](#the-globstar-)
  - [Pitfalls of Globbing](#pitfalls-of-globbing)
    - [The Problem: File Names as Commands](#the-problem-file-names-as-commands)
    - [Wildcards](#wildcards)
    - [Commonly Used Character Classes](#commonly-used-character-classes)
    - [Pattern Examples](#pattern-examples)
- [Managing Users and Groups](#managing-users-and-groups)
  - [Managing users](#managing-users)
  - [Understanding sudo](#understanding-sudo)
    - [Elevating privileges: `sudo`](#elevating-privileges-sudo)
- [Linux Software Management](#linux-software-management)
  - [The DEB package’s anatomy](#the-deb-packages-anatomy)
    - [Updating the Package List](#updating-the-package-list)
    - [Upgrading Software](#upgrading-software)
    - [Managing Packages (Install/Remove)](#managing-packages-installremove)
    - [`apt` vs. `apt-get`](#apt-vs-apt-get)
  - [The RPM packages anatomy](#the-rpm-packages-anatomy)
    - [Updating the System](#updating-the-system)
    - [Managing Software (Install/Remove)](#managing-software-installremove)
  - [Enabling Additional Repositories](#enabling-additional-repositories)
- [Introducing the Linux shell](#introducing-the-linux-shell)
  - [Explaining the command structure](#explaining-the-command-structure)
  - [Consulting the manual](#consulting-the-manual)
- [Bash Shell](#bash-shell)
  - [Shell autocompletion](#shell-autocompletion)
  - [How to execute several commands](#how-to-execute-several-commands)
  - [The `echo` command](#the-echo-command)
  - [The `pwd` command](#the-pwd-command)
  - [The `cd` command](#the-cd-command)
  - [The `ls` Command](#the-ls-command)
  - [Basic file operations](#basic-file-operations)
    - [The `touch` command](#the-touch-command)
    - [The `mkdir` Command](#the-mkdir-command)
    - [The `mv` Command](#the-mv-command)
    - [The `cp` Command](#the-cp-command)
    - [The `rm` Command](#the-rm-command)
    - [The `rmdir` Command](#the-rmdir-command)
    - [Read file Command (`cat`,`head`, `tail`)](#read-file-command-cathead-tail)
    - [The `find` Command](#the-find-command)
      - [Find file types](#find-file-types)
      - [Search by file size and filename](#search-by-file-size-and-filename)
      - [Find Tests](#find-tests)
      - [Predefined Actions](#predefined-actions)
      - [Operators](#operators)

# Introducing the Linux operating system

## Core Concepts: OS, Kernel, and Unix

- Operating System (OS): The system software that manages hardware and provides services (like UI and networking) for programs.

- Kernel: The "heart" of the OS. It is the specific layer responsible for managing the processor, memory, and hardware devices.

- Unix: A powerful, multi-user, and multitasking OS that serves as the architectural foundation for most modern systems (including macOS/iOS).

## The "Linux" Identity: GNU + Linux

**The term "Linux" as we use it today is actually a combination of two distinct projects:**

- The GNU Project (1983): Created by Richard Stallman with the goal of building a completely free and open-source Unix-like OS. It provided the utilities and tools (shell, compilers, etc.) but lacked a working kernel for a long time.

- The Linux Kernel (1991): Created by Linus Torvalds to manage hardware. It was released under the GPL (General Public License), ensuring the source code remains free and modifiable.

- Technical Distinction: Technically, what we use is GNU/Linux. The Linux kernel handles the hardware, while the GNU tools provide the user environment. In common language, we simply call the entire package "Linux."

## Why Linux Matters

- Versatility: It runs everything from massive data centers and cloud servers to Android smartphones and IoT devices.

- Unix-like: It replicates the power of the original proprietary Unix systems but remains open-source and free to modify.

- Multi-user/Multitasking: It inherently supports different permission levels and running multiple apps simultaneously, making it highly secure and efficient.

# Linux Distributions

## What is a Linux Distribution

- A Linux distribution (or "distro") is an operating system built on top of the GNU/Linux core (the Kernel plus GNU software).
  - **Customization**: Each distro adds specific software and default configurations to cater to different user groups.

  - **Software Overlap**: While many tools (like web servers) are available across all distros, the way they are configured or managed may vary slightly.

  - **Cost**: Most are free under open-source licenses, though some enterprise versions require a paid license for support and access.

## Common Linux distributions

- Fedora, CentOS Stream, Rocky Linux and RHEL
- Debian
- Ubuntu
- Linux Mint
- openSUSE

# The Linux filesystem

## Important Facts About Filenames

- On Linux systems, files are named in a manner similar to that of other systems such as Windows, but there are some important differences.
- Filenames that begin with a period character are hidden (Example `.index.html`). This only means that ls will not list them unless you say `ls -a`. When your account was created, several hidden files were placed in your home directory to configure things for your account. In Chapter 11 we will take a closer look at some of these files to see how you can customize your environment. In addition, some applications place their configuration and settings files in your home directory as hidden files.
- Filenames and commands in Linux, like Unix, are case sensitive. The filenames `File1` and `file1` refer to different files.
- Though Linux supports long filenames that may contain embedded spaces and punctuation characters, limit the punctuation characters in the names of files you create to period, dash, and underscore. Most important, do not
  embed spaces in filenames. If you want to represent spaces between words in a filename, use underscore characters. You will thank yourself later.
- Linux has no concept of a “file extension” like some other operating systems. You may name files any way you like. The contents or purpose of a file is determined by other means. Although Unix-like operating systems don’t use file extensions to determine the contents/purpose of files, many application programs do.

## Directory structure

- Linux uses a hierarchical filesystem structure. It is similar to an upside-down tree, with the root (`/`) at the base of the filesystem. From that point, all the branches (directories) spread throughout the filesystem.
- The following are the directories that exist on almost all versions of Linux
  - `/`: Root directory. The root for all other directories.
  - `/bin`: Essential command binaries. The place where binary programs are stored.
  - `/boot`: Static files of the boot loader. The place where the kernel bootloader, and initramfs are stored
  - `/dev`: Device files. Nodes to the device equipment, a kernel device list.
  - `/etc`: Host-specific system configuration. Essential config files for the system, boot time loading scripts, crontab, fstab device storage tables, passwd user accounts file.
  - `/home`: user Home directory. The place where the user’s files are stored.
  - `/lib`: Essential shared libraries and kernel modules. Shared libraries are similar to Dynamic Link Library (DLL) files in Windows.
  - `/media`: Mount point for removable media. For external devices and USB external media.
  - `/mnt`: Mount point for mounting a filesystem temporarily. Used for legacy systems.
  - `/opt`: Add-on application software packages. The place where optional software is installed.
  - `/proc`: Virtual filesystem managed by the kernel. a special directory structure that contains files essential for the system.
  - `/sbin`: Essential system binaries. Vital programs for the system’s operation.
  - `/srv`: Data for services provided by this system.
  - `/tmp`: Temporary files.
  - `/usr`: Secondary hierarchy. The largest directory in Linux that contains support files for regular system users
  - `/usr/bin` – system-executable files
  - `/usr/lib` – shared libraries from `/usr/bin`
  - `/usr/local` – source compiled programs not included in the distribution
  - `/usr/sbin` – specific system administration programs
  - `/usr/share` – data shared by the programs in /usr/bin such as config files, icons, wallpapers or sound files
  - `/usr/share/doc` – documentation for the system-wide files
  - `/var`: Variable data. Only data that is modifiable by the user is stored here, such as databases, printing spool files, user mail, and others; `/var/log` – contains log files that register system activity

### Exploring the Linux filesystem from the command line

- Feel free to explore the filesystem yourself by using the tree command. In Fedora Linux, it is already
  installed, but if you use Ubuntu, you will have to install it by using the following command

```bash
sudo apt install tree
```

- You can use the ls command to list the contents of directories, but tree offers different graphics. The following image shows you the differences between the outputs

![tree command](static/images/image_0001.png)

- In our example, the command will go down one level, starting from the root directory, represented by the forward slash as an argument

```bash
tree -L 1
```

## Understanding file paths

### Absolute Paths

- Absolute paths define the complete address of a file or folder starting from the root of the system.
  - **Starting Point**: They always start with a forward slash (/), representing the root directory.

  - **Consistency**: They work from anywhere in the system, regardless of your current working directory.

  - **Special Shortcut**: The tilde (`~`) is also treated as an absolute path because the shell (Bash) automatically expands it to the full path of your home directory (e.g., /home/username) before running the command.

Examples:

- `/home/giannis/Desktop`
- `~/Desktop`
- `/etc/network`

### Relative Paths

- Relative paths define a location relative to your Current Working Directory (PWD).
  - Starting Point: They do not start with a slash. They start with a folder name or a special dot notation.

  - Dependency: Their success depends entirely on where you are currently "standing" in the terminal.

- Common Notations:
  - `Desktop/` or `./Desktop/`: Look for a folder named "Desktop" inside the current folder.

  - `../`: Move one level up to the parent directory.

  - `../Documents`: Move one level up, then look for a folder named "Documents".

## Symbolic Links

- a symbolic link (also known as a soft link or symlink)
- The command used to create a symlink is `ln -s`. The syntax is: `ln -s [target_path] [link_name]`
- Why use Symbolic Links:
  - Suppose we install version 2.6 of “foo,” which has the filename “foo-2.6,” and then create a symbolic link
    simply called “foo” that points to “foo-2.6.” This means that when a program opens the file “foo,” it is actually opening the file “foo-2.6.” Now everybody is happy. The programs that rely on “foo” can find it, and we can still see what actual version is installed. When it is time to upgrade to “foo-2.7,” we just add the file to our system, delete the symbolic link “foo,” and create a new one that points to the new version. Not only does this solve the problem of the version upgrade, it also allows us to keep both versions on our machine. Imagine that “foo-2.7” has a bug (damn those developers!), and we need to revert to the old version. Again, we just delete the symbolic link pointing to the new version and create a new symbolic link pointing to the old version

## Hard Links

- When we create a hard link, we create an additional directory entry for a file
- Hard links have two important limitations:
  - A hard link cannot reference a file outside its own file system. This means a link cannot reference a file that is not on the same disk partition as the link itself.
  - A hard link may not reference a directory.
- When a hard link is deleted, the link is removed, but the contents of the file itself continue to exist (that is, its space is not deallocated) until all links to the file are deleted.

## Wildcards (File name expansion - Globbing)

- Globbing is the process where Bash rewrites or expands a command before it is executed. It uses wildcard characters to search for files that match a specific pattern.
  - The Power of Bash: Instead of moving 100 files manually, a single command with a wildcard can handle them all instantly.

  - Pre-execution: The shell expands the pattern into a list of filenames before the actual command (like mv or cp) ever sees it

- Important Distinctions
  - Not Regular Expressions: While they look similar, Globbing and Regular Expressions (Regex) use different syntax and rules. They are not the same thing.
  - Command Agnostic: Globbing is a feature of the shell, not the specific command. You can use it with `ls`, `mv`, `cp`, `echo`, and more.

### The Asterisk (`*`) Wildcard

- The most common wildcard is the asterisk, which matches **zero or more characters**

- Example: `mv *.jpeg images/`
  - Bash finds every file ending in `.jpeg` and replaces the `*.jpeg` part with the actual list of filenames.

- Versatility: It can be used anywhere in a string. For example, `echo *` will expand to every non-hidden file and folder in the current directory.

- Key Rules and Behaviors
  - Hidden Files: By default, the `*` wildcard does not match hidden files (those starting with a dot).
  - Failed Matches: `*` In Bash: If no files match the pattern, Bash treats the pattern as a literal string (e.g., it looks for a file actually named `*.jpeg`)
  - Quoting: To disable globbing, wrap the pattern in quotes (e.g., `'*.jpeg'`). This is useful if you actually have a file with a `*` in its name and don't want the shell to expand it.

### The Single Character Wildcard (?)

- Unlike the asterisk (which matches any number of characters), the question mark matches exactly one character.

- Use Case: If you have files like `IMG_1.jpg` and `IMG_A.jpg`, using `IMG_?.jpg` will find both.

- Example from lecture: `IMG_?6677.*` matches files where only one character varies between the prefix and the numbers.

### Square Brackets ([]) and Ranges

- Square brackets allow you to define a set or a range of characters for a single position in the filename.

- Numeric Ranges: `[0-9]` matches any single digit.

- Alphabetic Ranges: `[a-z]` matches any single lowercase letter.

- Manual Sets: `[abc]` matches exactly one character, but only if it is an 'a', 'b', or 'c'.

- Important Note: In standard globbing, if you want to match three digits, you must repeat the brackets three times (e.g., `[0-9][0-9][0-9]`). There is no "repeat" multiplier in basic globbing.

### The Globstar (`**`)

- The double asterisk is a powerful feature for recursive searching. It matches zero or more directories (including the slashes `/`) to find files in nested subfolders.

- Syntax: `**/*.jpg` searches the current folder and all subfolders for JPEG files.

- Requirements: `*` Supported in Bash 4.0 or higher.

- Often needs to be enabled manually with the command: `shopt -s globstar`.

- Pro Tip: The instructor recommends using the `**` followed by a slash to ensure you are looking into folders rather than just matching a folder name itself.

## Pitfalls of Globbing

### The Problem: File Names as Commands

- When you use a wildcard like `*`, Bash expands it into a list of every file in the directory before the command is executed. If a file in that directory happens to be named `-rf`, Bash will treat that filename as a command flag rather than a target file.
  - The Scenario: You have a file literally named `-rf`.

  - The Command: You run `rm *`.

  - The Result: Bash expands `*` to include `-rf`. The command effectively becomes `rm -rf [other files]`.

  - The Danger: This triggers a recursive, forced deletion. It will delete directories and subdirectories without asking for permission, potentially leading to permanent data loss.

- The Solution: Using `./*`
  - To prevent Bash from misinterpreting filenames as parameters, the lecture suggests a simple "best practice" adjustment to your syntax:
  - Instead of using `rm *`, use `rm ./*`
  - Why this works:
    - Explicit Pathing: By adding `./`, you are explicitly telling the shell that the expansion refers to a path in the current directory.
    - Neutralizing Flags: A file expanded as `./-rf` is seen by the system as a file path. Because it starts with a dot rather than a dash, the rm command will not interpret it as the "recursive/force" flag. It will simply try (and likely fail) to delete a file by 그 name, leaving your directories safe.

### Wildcards

| Wildcard        | Meaning                                                   | Example                               |
| :-------------- | :-------------------------------------------------------- | :------------------------------------ |
| `*`             | Matches **any** number of characters (including zero)     | `ls *.py` (All Python files)          |
| `?`             | Matches any **single** character                          | `ls file?.txt` (file1.txt, fileA.txt) |
| `[characters]`  | Matches any character that is a **member of the set**     | `ls [abc].txt` (file a, b, or c)      |
| `[!characters]` | Matches any character that is **NOT** a member of the set | `ls [!0-9].txt` (Non-numeric start)   |
| `[[:class:]]`   | Matches any character in a **predefined class**           | `ls [[:upper:]]*` (Uppercase files)   |

### Commonly Used Character Classes

| Character Class | Meaning                     | Matches                             |
| :-------------- | :-------------------------- | :---------------------------------- |
| `[[:alnum:]]`   | **Alphanumeric** characters | Any letter or digit (a-z, A-Z, 0-9) |
| `[[:alpha:]]`   | **Alphabetic** characters   | Any letter (a-z, A-Z)               |
| `[[:digit:]]`   | **Numerals**                | Any digit (0-9)                     |
| `[[:lower:]]`   | **Lowercase** letters       | Any small letter (a-z)              |
| `[[:upper:]]`   | **Uppercase** letters       | Any capital letter (A-Z)            |

- Example

```bash
# Find all files that start with a capital letter:
# Tìm tất cả các file bắt đầu bằng chữ cái viết hoa:
ls [[:upper:]]*

# Find files whose names end with at least one digit:
# Tìm các file có tên kết thúc bằng ít nhất một chữ số:
ls *[[:digit:]]

# Delete files whose names consist only of letters and numbers.
# Xóa các file có tên chỉ gồm các ký tự chữ và số
rm [[:alnum:]]*
```

### Pattern Examples

| Pattern                  | Matches                                                | Meaning                                                                 |
| :----------------------- | :----------------------------------------------------- | :---------------------------------------------------------------------- |
| `*`                      | All files                                              | Khớp với tất cả các file trong thư mục hiện tại.                        |
| `g*`                     | Any file beginning with **g**                          | Các file bắt đầu bằng chữ `g` (vd: `gmail`, `get_data.py`).             |
| `b*.txt`                 | Any file beginning with **b** and ending with **.txt** | File bắt đầu bằng `b`, sau đó là gì cũng được, kết thúc là `.txt`.      |
| `Data???`                | **Data** followed by exactly **3 characters**          | Khớp với `Data123`, `DataOld`, nhưng không khớp với `DataNewer`.        |
| `[abc]*`                 | Beginning with **a, b, or c**                          | Các file bắt đầu bằng một trong ba chữ cái `a`, `b`, hoặc `c`.          |
| `BACKUP.[0-9][0-9][0-9]` | **BACKUP.** followed by **3 numerals**                 | Khớp với các file backup có số thứ tự (vd: `BACKUP.001`, `BACKUP.999`). |
| `[[:upper:]]*`           | Beginning with an **uppercase letter**                 | Tất cả các file bắt đầu bằng chữ cái viết hoa.                          |
| `[![:digit:]]*`          | **Not** beginning with a **numeral**                   | Tất cả các file không bắt đầu bằng con số.                              |
| `*[[:lower:]123]`        | Ending with **lowercase** or **1, 2, 3**               | File kết thúc bằng một chữ cái thường hoặc một trong các số 1, 2, 3.    |

# Managing Users and Groups

## Managing users

- In this context, a user is anyone using a computer or a system resource. In its simplest form, a Linux
  user or user account is identified by a name and a unique identifier, known as a UID.

- Linux categorizes users based on their role and level of access to the system:
  - **System Accounts**: These are used to run background tasks and services (like web servers or databases). Notably, they usually do not have a home directory.

  - **Regular Users**: These are standard accounts created for people.
    - They have a dedicated home directory for personal files.

    - They are restricted from accessing other users' files or performing administrative tasks by default.

  - **Superuser** (Root): This is the most powerful account on the system.
    - It has unrestricted access to every file and setting.

    - It can add/remove users, install software, and modify system configurations.

## Understanding sudo

### Elevating privileges: `sudo`

- The root user is the default superuser account in Linux, and it has the ability to do anything on a
  system. Ideally, acting as root on a system should generally be avoided due to safety and security
  reasons.
- With `sudo`, Linux provides a mechanism for promoting a regular user account to superuser
  privilege.
  - **Temporary Elevation**: It doesn't turn you into the root user permanently; it only elevates the specific command you are running.

  - **Authentication**: When using sudo, the system asks for your user password, not the root password.

  - **Configuration**: Not all users can use sudo. During installation (Ubuntu/CentOS), a user must be designated as an "administrator" or added to the "sudoers" list to have this ability.

- Syntax `sudo command [-option(s)] [argument(s)]`

```bash
ls /root
# ls: cannot open directory '/root': Permission denied

sudo ls /root
# snap
```

- Built-in command can't run with sudo command

```bash
sudo cd vandtt
# sudo: "cd" is a shell built-in command, it cannot be run directly.
```

- The "Nuclear" Warning: Risk of High Privileges
  - The most critical takeaway is that sudo removes the system's "safety rails." To demonstrate, the instructor runs a destructive command: `sudo rm -rf /etc`

  - The Result: This command deletes the /etc folder, which contains essential system configuration files.

  - The Aftermath: Upon rebooting, the system fails to load, showing multiple "Failed" messages.

  - Lesson: Always **double-check** commands before using sudo. In a real-world environment (not a Virtual Machine), this would result in catastrophic data loss and system failure.

# Linux Software Management

- In Linux, applications come bundled into **repositories**. A **repository** is a centrally managed location that consists of software packages maintained by developers
- Each Linux distribution comes with several official repositories, but on top of those, you can add some new ones
  - Ubuntu uses deb packages, as it is based on Debian
  - Fedora (or Rocky Linux and AlmaLinux) uses rpm packages, as it is based on RHEL

## The DEB package’s anatomy

### Updating the Package List

- Before installing or upgrading software, you must synchronize your local database with the online repositories.

- Command: `sudo apt update`

- Purpose: This does not install new software. It only refreshes the list of available packages and their versions.

- Note: This requires sudo (root privileges) because it accesses protected system files.

### Upgrading Software

- Once the list is updated, you can move to the actual upgrade process.
- Command
  - `sudo apt upgrade`: Performs a "small" upgrade. It updates existing packages and, in the apt version, will install new dependencies if required.

  - `sudo apt full-upgrade` (or dist-upgrade): Performs a "large" upgrade. It can install new packages or remove existing ones if they conflict with the upgrade. It is more thorough but carries a slightly higher risk of changing system behavior.

- Kernel Updates: If the system upgrades the kernel (the core of the OS), a reboot is usually required.

### Managing Packages (Install/Remove)

- The lecture demonstrates how to add or take away specific tools:

- Install: `sudo apt install <package_name>` (e.g., cowsay `sudo apt install cowsay`).

- Remove: `sudo apt remove <package_name>`.

- Cleanup: `sudo apt autoremove` deletes packages that were installed as dependencies but are no longer needed by any current software. This is a common troubleshooting step for resolving upgrade conflicts.

### `apt` vs. `apt-get`

- The instructor notes that while apt and apt-get are often used interchangeably, there is a subtle difference:

- `apt upgrade` will install new dependencies if needed.

- `apt-get upgrade` generally will not install new dependencies; it only updates what is already there.

## The RPM packages anatomy

### Updating the System

- In CentOS, keeping the system current is straightforward because the package manager automatically handles list refreshes.

- Commands: `sudo dnf upgrade` or `sudo dnf update`.

- Key Difference from Ubuntu: Unlike `apt`, you do not need a separate "update" command to refresh package lists; DNF does this automatically before upgrading.

- Rebooting: If the kernel is updated, a system restart is strongly recommended to apply the changes.

### Managing Software (Install/Remove)

- Install: `sudo dnf install <package_name>`

- Remove: `sudo dnf remove <package_name>`

- Legacy Support: The older command `yum` still works as an alias for `dnf` for those familiar with older versions of CentOS.

## Enabling Additional Repositories

- Additional repositories are third-party or non-standard software sources added to a Linux system to install specific applications not available in default repositories
- Example on CentOS
  - Install EPEL: `sudo dnf install epel-release` (This adds new "servers" or sources for software).

  - Enable CodeReady Builder (CRB): Many EPEL packages require the CRB power tools. This is enabled via `sudo crb enable`.

  - Refresh: Run `sudo dnf update` again to sync the newly added lists.

  - Security: You may be asked to confirm GPG keys (digital signatures) during installation to ensure the software is authentic.

# Introducing the Linux shell

- Linux has its roots in the Unix operating system, and one of its main strengths is the **command-line interface**. In the old days, this was called the **shell**
- The shell is a program that has two streams: an input stream and an output stream. The input is a
  command given by the user, and the output is the result of that command, or an interpretation of it.
- In other words, the shell is the primary interface between the user and the machine
- The main shell in major Linux distributions is called **Bash**, which is an acronym for Bourne Again
  Shell, named after Steve Bourne, the original creator of the shell in UNIX
- Alongside Bash, there are other shells available in Linux, such as **ksh**, **tcsh**, and **zsh**

- One shell can be assigned to each user. Users on the same system can use different shells. One way
  to check the default shell is by accessing the command

```bash
cat /etc/passwd | grep <<user>>

# <<user>> is user account in linux system
```

- An easier way to see the current shell is by running the following command

```bash
echo $0
```

## Explaining the command structure

- In a nutshell, Unix and Linux commands have the following form:
  - The command’s name
  - The command’s options
  - The command’s arguments

```bash
command [-option(s)] [argument(s)]
```

## Consulting the manual

- Almost all commands in Linux have a `--help` option. You can use this for quick reference.

```bash
 <<commnad_name>> --help

# commnad_name is name of command
```

- The `man` command is the standard way to read comprehensive, built-in manuals for almost any program. Syntax `man [command]`

# Bash Shell

## Shell autocompletion

- To make use of shell autocompletion, start typing a file or directory name and **press Tab**
- The shell will progressively narrow your choices, displaying possible matches below the line you’re typing on

## How to execute several commands

- The semicolon allows you to chain commands together so they run sequentially (one after the other).

- Syntax: `command1 ; command2 ; command3`

- Execution: The shell runs command1, waits for it to finish, then runs command2, and so on.

- Trailing Semicolon: You can put a semicolon at the very end of the line, but it is optional and usually omitted.

-Example: `echo -n "Hello " ; echo "World"`

## The `echo` command

- The primary purpose of echo is to output text to the terminal.
- **Quotes**: In Bash, single quotes are used to wrap strings
- Working with Options
  - `-n` (No newline): By default, echo adds a line break at the end. Using `-n` prevents this, causing the terminal prompt to appear immediately after the output.

  - `-e` (Enable backslash escapes): This allows the command to interpret special characters like `\n` as an actual line break within the string.

  - Combining Options: You can use options separately (e.g., `-n -e`) or combine them into a single block (e.g., `-ne` or `-en`). The order usually does not matter for most Unix commands

```
echo -e 'This is my car\nThis is my car'

# This is my car
# This is my car

echo -en "Danh sách mua sắm:\n\t* Táo\n\t* Chuối\n"

# Danh sách mua sắm:
#     * Táo
#     * Chuối
```

## The `pwd` command

- `pwd` (Print Working Directory): Use this command to display the full path of your current location.

```bash
pwd
# home/sonda
```

## The `cd` command

- The `cd` command is used to move between folders. You can navigate using different types of paths:

- Linux/Unix Structure: There are no drive letters (like C:). Everything starts from the root folder (`/`).

- Home Directory: Represented by the tilde (`~`)` symbol, this is your user-specific folder (e.g., /home/username or /Users/username on macOS)

- Navigation Methods

| Command                | Result                                                                        |
| :--------------------- | :---------------------------------------------------------------------------- |
| **`pwd`**              | **Print Working Directory**: Displays the full path of the current directory. |
| **`cd [folder]`**      | Moves into a subfolder of your current directory (e.g., `cd Desktop`).        |
| **`cd /`**             | Moves to the **Root** directory (the base of the entire system).              |
| **`cd ..`**            | Moves up one level to the **Parent** directory.                               |
| **`cd ../..`**         | Moves up two levels.                                                          |
| **`cd ~`** or **`cd`** | Returns you instantly to your **Home** directory.                             |
| **`cd -`**             | Moves back to the previous directory you were in.                             |

- Pro-Tips for Efficiency
  - Tab Autocomplete: Type the first few letters of a folder name and press Tab. The shell will automatically complete the name for you, saving time and preventing typos.

- Example absolute path

```bash
[me@linuxbox usr]$ pwd
/# usr

[me@linuxbox usr]$ cd /usr/bin
[me@linuxbox bin]$ pwd
# /usr/bin
```

- Example relative path

```bash
[me@linuxbox usr]$ pwd
/# usr

[me@linuxbox usr]$ cd ./bin
[me@linuxbox bin]$ pwd
# /usr/bin
```

## The `ls` Command

- The `ls` command shows the contents of your current working directory.
  - Context: By default, it operates on your Present Working Directory (PWD), but it can be pointed at any path.

- Command Options (Flags)

| Command                | Description                                                         |
| :--------------------- | :------------------------------------------------------------------ |
| **`ls`**               | List files/folders in the current directory.                        |
| **`ls -a`**            | List **all** files (including hidden files starting with `.`).      |
| **`ls -t`**            | Sort contents by **time** (newest first).                           |
| **`ls -r`**            | **Reverse** the sorting order.                                      |
| **`ls -rt`**           | Sort by time in reverse (useful to see newest files at the bottom). |
| **`ls [path]`**        | List contents of a **specific folder** (e.g., `ls /etc`).           |
| **`ls --color=never`** | Disable colorized output.                                           |
| **`ls -l`**            | Display results in long format                                      |

- Directory Arguments
  - You can provide a specific path as an argument to see what is inside a different folder without leaving your current location.

```bash
# will list everything in the root directory while you stay in your home folder

ls ~
```

- Combined Flags: `ls -la` is a very common shortcut to see all files in a detailed list format.

```bash
ls -la

# drwxr-xr-x  2 user user  4096 Mar 10 10:00 Desktop
# -rw-r--r--  1 user user   220 Mar 10 09:00 .bashrc
```

- Linux `ls -l` Output Breakdown

| Component                   | Example        | Description                                                                                                                                                                                                |
| :-------------------------- | :------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **File Type & Permissions** | `drwxr-xr-x`   | The first character indicates the type (`d` for directory, `-` for regular file). The next 9 characters represent permissions for **Owner**, **Group**, and **Others** ($r$=read, $w$=write, $x$=execute). |
| **Hard Links**              | `2`            | The number of hard links pointing to the file or directory.                                                                                                                                                |
| **Owner**                   | `user`         | The username of the account that owns the file.                                                                                                                                                            |
| **Group**                   | `user`         | The name of the group that has specific permissions for this file.                                                                                                                                         |
| **Size**                    | `4096`         | The file size in bytes. (Tip: Use `ls -lh` to see this in "human-readable" format like KB or MB).                                                                                                          |
| **Timestamp**               | `Mar 10 10:00` | The date and time the file was last modified.                                                                                                                                                              |
| **Name**                    | `Desktop`      | The actual name of the file or directory.                                                                                                                                                                  |

## Basic file operations

### The `touch` command

- While commonly used to create new files, its primary technical purpose is different.

- Primary Use: To create an empty file (or multiple files) quickly.

- Example:

```bash
# creates two empty files simultaneously.
touch file1 file2
```

- Technical Function: It modifies the timestamp of a file.
  - If the file does not exist, touch creates it.

  - If the file already exists, touch updates its "last modified" timestamp to the current time without changing the file's content.

### The `mkdir` Command

- This command stands for "make directory."

- Purpose: To create a new folder (directory).

- Example:

```bash
# creates a folder named "ready" in the current location.
mkdir ready
```

- Distinguishing Files vs. Folders: `*` In a standard terminal, they might look identical in plain text.
  - Colors: You can use `ls --color` to visually differentiate them (folders are typically blue, while files are white/grey). Most modern terminals support this by default.

### The `mv` Command

- The `mv` command is versatile because it handles both moving and renaming in a single utility.

- Moving a File: To move a file into a folder, use `mv [filename] [destination_folder]`.

- Example:

```bash
mv ann.txt ready/
```

- Renaming a File: To rename a file, "move" it to a new name in the same location.

- Example:

```bash
mv max.txt maximilian.txt
```

- Move and Rename at Once: You can change both the location and the name simultaneously.

Example:

```bash
mv maximilian.txt ready/max.txt
```

- Pro Tip: Instead of using `cd` to check if a move worked, use `ls [folder_name]` to peek into a directory without leaving your current one.

### The `cp` Command

- The cp command creates duplicates of files or directories.

- Copying a File: Use `cp [source] [destination]`.

- Example:

```bash
cp laura.txt laura_backup.txt
cp laura.txt ./ready # cp laura.txt ready
```

- Copying to a Folder: You can copy a file into a different directory while optionally giving it a new name.

- Example:

```bash
cp laura.txt ready/lauren.txt
```

- Copying Directories (-R): By default, cp cannot copy folders. To copy a folder and all its contents, you must use the recursive flag: -R.

- Example:

```bash
cp -R ready ready_backup
```

### The `rm` Command

- The `rm` command is the standard way to delete files, but it comes with a major warning.

- Deleting Files: Use `rm [filename]` or list multiple files to delete them at once.

- Example:

```bash
rm ann.txt eva.txt
```

- ⚠️ The Danger Zone: Unlike clicking "Delete" in a graphic interface, rm does not send files to a Trash or Bin. They are permanently deleted immediately.

- Deleting Directories (-r): To delete a folder and everything inside it, you must use the recursive flag -r (or -R).

- Example:

```bash
rm -r ready_backup/
```

### The `rmdir` Command

- Because rm -r is so powerful and risky, rmdir serves as a "safety first" alternative.

- Usage: `rmdir [folder_name]`

- The Safety Catch: This command only works if the directory is completely empty. If there is even one file inside, Bash will block the command and give you an error.

- Hidden Files: A folder might look empty in your file explorer but still fail to delete via rmdir. This is often due to hidden files (files starting with a dot, like .DS_Store or .thumbs.db). To see these, use ls -a.

- You must delete the hidden files first before rmdir will work.

### Read file Command (`cat`,`head`, `tail`)

### The `find` Command

- `find` command, a powerful and sophisticated tool for searching files and directories in a Unix-based environment. Unlike basic bash globbing (using wildcards like `*`), find allows for highly specific search queries based on file attributes
- The basic syntax requires the command followed by the starting path: `find [path]`
  - Performance Note: Searching large directories (like the root directory) can take a long time. You can terminate a hanging or long-running process by pressing **Ctrl + C**.

#### Find file types

| File Type | Description                   | Example Command     |
| --------- | ----------------------------- | ------------------- |
| b         | Block special device file     | `find /dev -type b` |
| c         | Character special device file | `find /dev -type c` |
| d         | Directory                     | `find . -type d`    |
| f         | Regular file                  | `find . -type f`    |
| l         | Symbolic link                 | `find . -type l`    |

#### Search by file size and filename

```bash
find ~ -type f -name "*.JPG" -size +1M
```

- In this example
  - We add the `-name` test followed by the wildcard pattern
  - Notice how we enclose it in quotes to prevent pathname expansion by the shell
  - We add the `-size` test followed by the string `+1M`. The leading plus `+` sign indicates that we are looking for files larger than the specified number. A leading minus `-` sign would change the meaning of the string to be smaller than the specified number. Using no sign means **“match the value exactly”**. The trailing letter `M` indicates that the unit of measurement is megabytes

- Find Size Units

  | Character | Unit                                       | Example             |
  | --------- | ------------------------------------------ | ------------------- |
  | b         | 512-byte blocks (default if no unit given) | `find . -size 10b`  |
  | c         | Bytes                                      | `find . -size 100c` |
  | w         | 2-byte words                               | `find . -size 50w`  |
  | k         | Kilobytes (1,024 bytes)                    | `find . -size 10k`  |
  | M         | Megabytes (1,048,576 bytes)                | `find . -size 5M`   |
  | G         | Gigabytes (1,073,741,824 bytes)            | `find . -size 1G`   |

#### Find Tests

- Note that in cases where a numeric argument is required, the same `+` and `-` notation discussed previously can be applied

| Test           | Description                                                                                                                                                         | Example Command                |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------ |
| -cmin n        | Match files or directories whose content or attributes were last modified exactly n minutes ago. Use `-n` for less than n minutes and `+n` for more than n minutes. | `find . -cmin -10`             |
| -cnewer file   | Match files or directories whose contents or attributes were modified more recently than the specified file.                                                        | `find . -cnewer reference.txt` |
| -ctime n       | Match files or directories whose contents or attributes were last modified `n*24` hours ago.                                                                        | `find . -ctime 2`              |
| -empty         | Match empty files and directories.                                                                                                                                  | `find . -empty`                |
| -group name    | Match files or directories belonging to group `name` (group name or numeric GID).                                                                                   | `find . -group developers`     |
| -iname pattern | Same as `-name` but case-insensitive.                                                                                                                               | `find . -iname "*.txt"`        |
| -inum n        | Match files with inode number `n`. Useful for finding hard links.                                                                                                   | `find / -inum 12345`           |
| -mmin n        | Match files or directories whose contents were last modified `n` minutes ago.                                                                                       | `find . -mmin -30`             |
| -mtime n       | Match files or directories whose contents were last modified `n*24` hours ago.                                                                                      | `find . -mtime -1`             |
| -name pattern  | Match files and directories with the specified wildcard pattern.                                                                                                    | `find . -name "*.log"`         |
| -newer file    | Match files and directories modified more recently than the specified file.                                                                                         | `find . -newer backup.log`     |
| -nouser        | Match files and directories that do not belong to a valid user.                                                                                                     | `find / -nouser`               |
| -nogroup       | Match files and directories that do not belong to a valid group.                                                                                                    | `find / -nogroup`              |
| -perm mode     | Match files or directories whose permissions match the specified mode (octal or symbolic).                                                                          | `find . -perm 644`             |
| -samefile name | Match files that share the same inode number as `name`.                                                                                                             | `find . -samefile file.txt`    |
| -size n        | Match files of size `n`.                                                                                                                                            | `find . -size 100M`            |
| -type c        | Match files of type `c`.                                                                                                                                            | `find . -type f`               |
| -user name     | Match files or directories belonging to `user`.                                                                                                                     | `find /home -user john`        |

#### Predefined Actions

- Having a list of results from our `find` command is useful, but what we really want to do is act on the items on the list. Fortunately, find allows actions to be performed based on the search results.

| Action  | Description                                                                                                                   | Example Command                          |
| ------- | ----------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------- |
| -delete | Delete the currently matching file.                                                                                           | `find . -name "*.tmp" -delete`           |
| -ls     | Perform the equivalent of `ls -dils` on the matching file. Output is sent to standard output.                                 | `find . -type f -ls`                     |
| -print  | Output the full pathname of the matching file to standard output. This is the default action if no other action is specified. | `find . -name "*.txt" -print`            |
| -quit   | Quit immediately once a match has been made.                                                                                  | `find / -name "config.php" -print -quit` |

#### Operators

- For example, what if we needed to determine whether all the files and subdirectories in a directoryhad secure permissions? We would look for all the files with permissions that are not 0600 and the directories with permissions that are not 0700. Fortunately, find provides a way to combine tests using logical operators to create more complex logical relationships. To express the aforementioned test, we could do this

```bash
find ~ \( -type f -not -perm 0600 \) -or \( -type d -not -perm 0700 \)
```

- Explain example above

| Component         | Description                                                                                                                      |
| ----------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `find ~`          | Starts the search from the current user's Home directory.                                                                        |
| `\( ... \)`       | Escaped parentheses used to group conditions together (similar to mathematical grouping) so that the logic is applied correctly. |
| `-type f`         | Filters the search to include only regular files.                                                                                |
| `-not -perm 0600` | Finds files that **do NOT** have `0600` permissions (Owner: Read/Write; Group/Others: None).                                     |
| `-or`             | Logical OR operator: returns results if either the file condition group **OR** the directory condition group is met.             |
| `-type d`         | Filters the search to include only directories.                                                                                  |
| `-not -perm 0700` | Finds directories that **do NOT** have `0700` permissions (Owner: Full Access; Group/Others: None).                              |

- Logical Operators

| Operator | Description                                                                                                                                                                                                                                                                       |
| -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-and`   | Match if the tests on both sides of the operator are true. When no operator is specified, `-and` is implied by default. This can be shortened to `-a `                                                                                                                            |
| `-or`    | Match if a test on either side of the operator is true. This can be shortened to `-o`                                                                                                                                                                                             |
| `-not`   | Match if the test following the operator is false. This can be abbreviated with an exclamation point `!`                                                                                                                                                                          |
| `( )`    | Group tests and operators together to form larger expressions. This controls the precedence of logical evaluations. By default, `find` evaluates expressions from left to right. Parentheses often need to be escaped (`\(` `\)`) because they have special meaning to the shell. |

- Let’s say that we have two expressions separated by a logical operator.In all cases, expr1 will always be performed; however, the operator will determine whether expr2 is performed

```bash
expr1 -operator expr2
```

| Result of `expr1` | Operator | `expr2` is...    |
| ----------------- | -------- | ---------------- |
| True              | `-and`   | Always performed |
| False             | `-and`   | Never performed  |
| True              | `-or`    | Never performed  |
| False             | `-or`    | Always performed |
