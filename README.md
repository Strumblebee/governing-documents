# Governing Documents of YSUGD

This repository holds the official versions of the Constitution and Bylaws for 
the Youngstown State University Game Developers student organization. You may
clone this repository to compile the documents into either .PDF or .DOCX format
using [Pandoc](https://pandoc.org/) (cross-platform). 

## Build Instructions

This repository is configured with a Makefile which utilizes Pandoc to convert 
all of the Markdown documents (with the exception of this README) in its root 
to both PDF and DOCX by default. PDF files are generated through (and require)
LaTeX, a typesetting language that produces consistent output across platforms
and allows for the structure of the document to be controlled 
programmatically.

### Linux Computer 

Ensure that both Pandoc and a LaTeX distribution (such as TeX-Live) are 
installed through your distribution's package manager. At the terminal, 
simply run

```Shell
$ make
```

and Pandoc will generate a PDF and DOCX file for each Markdown file contained
within the folder. If you wish to generate a specific file, such as a DOCX of the Constitution, you can simply type 

```Shell
$ make constitution.docx
```

and the file you specified will be generated. To clear all of the generated files, run ```make clean```. This is useful for keeping the directory organized and allows for files to be rebuilt after making changes to configuration files without changing the Markdown (generally during development only).

### Windows Desktop

You will need [Pandoc](https://pandoc.org/) to convert Markdown into other formats and a LaTeX distribution of some kind (we recommend [MiKTeX](https://miktex.org/)) to compile LaTeX documents to PDF. If you only need DOCX files, you can skip the installation of LaTeX.

#### Method 1: Using Cygwin

Because this project uses a Makefile, you will need certain GNU tools that are
commonly found on Linux distributions such as GNU `make` and `rm`. The easiest
way to obtain these files is to download [Cygwin](https://www.cygwin.com/), a 
collection of common Open-Source tools that allow you to operate in a 
"Linux-like" environment. 

When installing Cygwin, make sure to select the `make` package during installation. You may need to select "Full" or "Not 
Installed" from the dropdown in the upper-left corner of the installer to see
this option. If you forget to choose `make` or want to perform an upgrade later, you can re-run the installer to make changes to your existing installation. 

After the installation is finished, run Cygwin64 Terminal (or the equivalent
on 32-bit platforms) and navigate to the directory of your cloned repository
(your C: drive is located in /cygdrive/c). You can then run 

```Shell
$ make
```

to generate a PDF and DOCX file for each Markdown file contained
within the folder. If you wish to generate a specific file, such as a DOCX of the Constitution for example, you can simply type 

```Shell
$ make constitution.docx
```

and the file you specified will be generated. To clear all of the generated files, run ```make clean```. This is useful for keeping the directory organized and allows for files to be rebuilt after making changes to configuration files without changing the Markdown (generally during development only).
