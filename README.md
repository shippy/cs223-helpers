cs223-helpers
=============

I wrote up a few scripts that make my life easier while working on CS223 assignments. They work on my setup; I make no guarantees that they will work on yours, but I absolutely will accept pull requests that make them more generalizable. They are a work in progress, and [I'm afraid they'll never stop being that](http://xkcd.com/1319/).

## Suggested installation steps
1. Create a folder (say, `~/scripts`). Clone/download this repository into it.
2. Add the folder to PATH in your `.bash_profile` and/or `.profile` (I'm unsure which one).

## Scripts
All the following scripts assume the following:

1. You call them from the folder that contains your executable;
2. Your folder contains the numeral that identifies the homework in question (i.e. `Hwk2/` or `hw1/`);
3. Your folder only contains one executable, whose name is the same as the assignment name.

That is how it gleans the information it needs to automate using Stan's scripts.

### 1. submit.sh
`submit.sh` submits all files from folder that have a newer last-modified flag than their last-submission time (as per Stan's `check` script). If the file is not in the list of submitted files, it will ask if you want to submit it.

### 2. testfile.sh
Called with a test-case file as first argument (e.g. `testfile.sh tests/examples.c`), it will run cmp of your program and Stan's program. No output means that your code has the same output as Stan's code.

### 3. testcase.sh
Called with a test-case number (e.g. `testcase.sh 01`), it will pipe this test to your executable and give you cmp and diff with the correct solution. It assumes the files are in the form `Hwk$n/Tests/t$number.c` and the solutions are in the corresponding file `t$number.cs`, which I expect will not be true for any other homework assignment.

### 4. testit.sh
The script invokes Stan's `testit` script with the correct arguments when called from the homework folder.
