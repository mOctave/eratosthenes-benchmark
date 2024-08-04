# eratosthenes-benchmark
A repository containing slightly optimized Sieve of Eratosthenes code in a variety of programming languages.

## Benchmarking Instructions

Using this repository for benchmarking requires NodeJS and npm. Assuming that both have been set up and your working directory is the root one for the repo (the one containing this README file), you should then be able to install and run BenchmarkBot as follows:
```bash
npm i -g benchmarkbot
bb
```

Some options can be configured in `bbconf.json`. This file should be placed in the repo's root directory.

Here's everything that can go into `bbconf.json`:

```json
{
	"exclude": [],
	"cycles": 5
}
```

Setting `exclude` can be used to remove languages that you do not want to test. You may wish to do this if you do not have the compiler for a language and don't want to waste time while the bot realizes this, if you want to avoid a particularly slow programming language, or if you only want to test a couple of languages. Currently, there is no option to only `include` a few languages.

Setting `cycles` allows you to run BenchmarkBot multiple times, rebuilding and executing every program each cycle. Currently, there is no option to set `runs` which do not include a re-build.

Currently, there is no way to change the maximum number the program searches until, and it is capped at 1000000 (one million).

## Language Information

This repo currently contains code in 14 different programming languages, as described below. The following additional languages are planned but haven't yet been implemented: SQL, Bash, ARM Assembly, X86_64 Assembly, C, Rust, Kotlin, and Intercal. If you would like to add a program yourself, we would welcome any contributions: please check the [style documentation](docs) to see what's wanted.

The different languages currently included vary in how they're being used, what data structures they use to store the prime numbers, and what dependencies they have. What follows is a brief summary of all the currently implemented languages in alphabetical order.

### C++
**Status:** Implemented, Tested  
**Usage:** Compiled  
**Minimum Version:** C++11  
**Data Structure:** Vector  
**Note:** Compilation requires clang++  

### C#
**Status:** Implemented, Tested  
**Usage:** Compiled  
**Minimum Version:** Unknown  
**Data Structure:** List  
**Note:** Compilation requires mono   

### Fortran
**Status:** Implemented, Tested  
**Usage:** Compiled  
**Minimum Version:** Fortran 90  
**Data Structure:** Vector Array  

### Go
**Status:** Implemented, Tested  
**Usage:** Compiled  
**Minimum Version:** Unknown  
**Data Structure:** Array  
**Note:** Your IDE may throw errors about having C++ files in the same directory as the GoLang.go file. These errors do not interfere with the program's execution and should be ignored.  

### Iris
**Status:** Implemented, Tested  
**Usage:** Scripting  
**Minimum Version:** 6.0.0.7  
**Data Structure:** Javascript-Style Array  
**Note:** Iris is currently not publicly available. If you wish to obtain a copy of the Iris compiler, [contact iannl](https://iannl.com/links/).  

### Java
**Status:** Implemented, Tested  
**Usage:** Compiled  
**Minimum Version:** Unknown  
**Data Structure:** ArrayList  

### Julia
**Status:** Implemented, Tested  
**Usage:** Scripting  
**Minimum Version:** Unknown  
**Data Structure:** Array  

### Lua
**Status:** Implemented, Tested  
**Usage:** Scripting  
**Minimum Version:** Unknown  
**Data Structure:** Table  

### NodeJS
**Status:** Implemented, Tested  
**Usage:** Scripting  
**Minimum Version:** Unknown  
**Data Structure:** Javascript-Style Array  

### Perl
**Status:** Implemented, Tested  
**Usage:** Scripting  
**Minimum Version:** Unknown  
**Data Structure:** Array  

### PHP
**Status:** Implemented, Tested  
**Usage:** Scripting  
**Minimum Version:** Unknown  
**Data Structure:** Array (Ordered Map)  

### Python
**Status:** Implemented, Tested  
**Usage:** Scripting  
**Minimum Version:** 3  
**Data Structure:** List  

### Ruby
**Status:** Implemented, Tested  
**Usage:** Scripting  
**Minimum Version:** Unknown  
**Data Structure:** Array  

### Rust
**Status:** Implemented, Tested  
**Usage:** Compiled  
**Minimum Version:** Unknown  
**Data Structure:** Vector  
**Note:** Currently unrunnable through BenchmarkBot.  

### Swift
**Status:** Implemented, Tested  
**Usage:** Compiled  
**Minimum Version:** Unknown  
**Data Structure:** Array  
