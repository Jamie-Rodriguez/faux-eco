Faux-Eco
========

This repo provides a way of mocking a command-line program or utility that you may not have access to on your local machine/environment.

It compiles an executable that will output the text provided by a text file.

Typically you would then add the compiled executable (renamed to the utility you want to mock) to your `PATH` to mock the utility.

**Note**: When I use the term "*text file*", it specifically means any file with text characters. For example `.txt`, `.html`, `.js`, `.md` files are all valid files to be provided to this utility.

Naming
======

Most probably, this program is being used to mock another program/utility and so you will need to rename the compiled executable in order to mock it. It's a bit more convenient to do this by either providing the `TARGET` flag to `make`, or by overwriting `TARGET` inside `makefile`.

Dynamically-Linked
==================

In this mode, the executable and text file are decoupled from each other. You will have to provide a path to the text file you wish to mock.

This mode is useful when you may frequently want to change the output of the program in a short time period (for me, often when debugging something).

Compile with the default build target:

```bash
make
```

Run as

```bash
./faux-eco path/to/file.txt
```

Statically-Linked
=================

As the antithesis of the dynamically-linked compilation scenario - sometimes you may *not* want to change the output of the mocking utility at all! iT can be annoying and error-prone to have to continuously provide a text file to the utility.

To compile, you will most probably have to define the path to your text file by providing the `DATA_FILE` flag to `make`.

```bash
make static DATA_FILE=your-text-file.html
```

To run, you only need to execute the program by itself:

```bash
./faux-eco
```
