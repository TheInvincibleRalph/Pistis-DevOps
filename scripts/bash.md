## File Descriptor Redirection Cheat Sheet

### Catching File descriptors

To catch a Standard Output or Standard Error for the purpose of redirecting the data to a file, we can place the File Descriptor number before the redirection symbol. The code will be like this:


### Redirection of Standard Error

```bash
ls -j 2> stderr.txt
```

### Redirection of Standard Output

```bash
ls -l > stdout.txt
```

> Note: Remember that the redirection of Standard Output has an invisible 1 before the redirection symbol by default , so it does not need to be explicitly typed.*


### Converting File descriptors

To Convert a file descriptor from one type to another, add to the syntax an ampersand symbol on the right side of the greater than redirection symbol, followed by the File Descriptor number:


### Converting Stdout to Stderr

```bash
echo "I'm turning this Standard Output echo into a Standard Error" >&2
```

### Converting Stderr to Stdout

```bash
ls -j 2>&1
```

Observe the difference between catching a File Descriptor to a place; and converting a File Descriptor to the opposite type.