# ASM_AutoGenerator
Assemble, Link and Run your assembly code.

Created by me! [@JOwen-ster](https://github.com/JOwen-ster/)

Used by [Joshua Ku](https://www.linkedin.com/in/joshua-ku-35a7b453) at Cal. State Fullerton, CPSC240 Computer Organization and Assembly Language, Fall 2024, Section 01/02, NMBR-17998

## Getting Started

**Clone This Repository**
- [X] **HTTPS**
```
git clone https://github.com/JOwen-ster/ASM_AutoGenerator.git
```

- [X] **SSH**
```
git clone git@github.com:JOwen-ster/ASM_AutoGenerator.git
```

- [X] **GH CLI**
```
gh repo clone JOwen-ster/ASM_AutoGenerator
```

Change to this repository's directory
`cd ASM_AutoGenerator/`

Move the script to your assembly file's directory
`mv builder.sh PATH/TO/YOUR/ASSEMBLY/DIRECTORY`

Change directory to where your assembly file is
`cd PATH/TO/YOUR/ASSEMBLY/DIRECTORY`

Set execution permissions for `asmbuilder.sh`
```
chmod 700 asmbuilder.sh
```

## Usage
```console
bash asmbuilder.sh <FILENAME> <RUN> <DEBUG>

REQUIRED:
       <FILENAME>

OPTIONS:
       <RUN>: y OR n
       <DEBUG>: y OR n
------------------------------
```

Run the script
```
bash asmbuilder.sh example y n
```
OR
```
bash builder.sh example
```

