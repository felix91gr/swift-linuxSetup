# Swift@Linux Setup
_Shell Scripts and instructions on how to set up Swift on Linux._

**WARNING:** these scripts are in Alpha right now. Don't use them unless you know what you're doing.

But if you do, leave some feedback! ^o^

**WARNING 2:** the information provided here is not complete. Feel free to leave feedback about that too!


## Get started

There is an alternative setup at the end of this _README_

### Zeroth: be running Ubuntu 16.04 or equivalent.

_The scripts are intended for use in Ubuntu_

### First, clone this repo.

_Of course._

### Second: run `Prereq.sh.` 

_Prereq will install all the basic dependencies for running the build scripts._

### Third: run `SetupTheCompiler.sh`

_It will build the Swift Compiler and its toolchain, using the presets by @jinmingjian. It might take a good while._

### Fourth: run `SourceKiteAndSDE.sh`

_It will download and build the last piece required for SDE to work: **sourcekite**_

## Alternative Setup

You can replace the third step by using the script `AlternativeCompiler.sh`. That will download ready-to-use binaries from one of the latest snapshopts of **Swift 3.1**
