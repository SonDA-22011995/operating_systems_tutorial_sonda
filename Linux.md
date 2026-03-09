- [Introducing the Linux operating system](#introducing-the-linux-operating-system)
  - [Core Concepts: OS, Kernel, and Unix](#core-concepts-os-kernel-and-unix)
  - [The "Linux" Identity: GNU + Linux](#the-linux-identity-gnu--linux)
  - [Why Linux Matters](#why-linux-matters)
- [Linux Distributions](#linux-distributions)
  - [What is a Linux Distribution](#what-is-a-linux-distribution)
  - [Common Linux distributions](#common-linux-distributions)
  - [Choosing a Linux distribution](#choosing-a-linux-distribution)
    - [Linux Distribution Selection Matrix](#linux-distribution-selection-matrix)
- [Linux Shell](#linux-shell)

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

## Choosing a Linux distribution

### Linux Distribution Selection Matrix

| Criteria           | Sub-Category          | Recommended Distros                | Key Rationale                                                       |
| :----------------- | :-------------------- | :--------------------------------- | :------------------------------------------------------------------ |
| **Platform**       | **Server**            | Ubuntu Server, Rocky Linux, Debian | Minimalist core, essential services (SSH, HTTP), high optimization. |
|                    | **Desktop**           | Ubuntu, Fedora, Pop!\_OS, Deepin   | Pre-loaded with GUI and user-friendly software packages.            |
|                    | **Embedded**          | Raspbian, OpenWRT, Fedora IoT      | Highly optimized for small-form factors and limited resources.      |
| **Infrastructure** | **Cloud / VPS**       | Amazon Linux, RHEL, Ubuntu         | Availability of optimized cloud images for AWS, Azure, and GCP.     |
|                    | **Containers**        | **Alpine Linux**, Fedora CoreOS    | Low footprint, lightweight, and easier to scale in K8s/Docker.      |
| **Performance**    | **High Tuning**       | Gentoo, Arch Linux                 | Allows kernel-level recompilation and granular package control.     |
|                    | **Balanced**          | Ubuntu LTS, openSUSE Leap          | Ready-to-use performance optimizations for most applications.       |
| **Security**       | **Desktop Isolation** | Qubes OS, Whonix, Tails            | Specialized in application isolation and anonymity.                 |
|                    | **Pen-Testing**       | Kali Linux, Parrot Security OS     | Built-in tools for security research and penetration testing.       |
|                    | **Server Hardening**  | RHEL, Rocky Linux, SUSE (SLE)      | Frequent stable upgrades and strictly controlled repositories.      |
| **Reliability**    | **Conservative**      | Debian, RHEL, Rocky Linux          | Slower release cycles, extensively tested codebases.                |
|                    | **Leading-Edge**      | Fedora, openSUSE Tumbleweed        | Rapid releases ("Rolling"), incorporating the latest upstream code. |

# Linux Shell
