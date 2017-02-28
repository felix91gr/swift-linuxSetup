# Swift@Linux Setup
_Shell Scripts and instructions on how to set up Swift on Linux._

**WARNING:** these scripts are in Alpha right now. Don't use them unless you know what you're doing.

But if you do, leave some feedback! ^o^

**WARNING2:** the information provided here is not complete. Feel free to leave feedback about that too!


## Get started

0. Zeroth: be running Ubuntu 16.04 or equivalent.

_The scripts are intended for use in Ubuntu_

1. First, clone this repo.

_Of course._

2. Second: run Prereq.sh. 

_Prereq will install all the basic dependencies for running the build scripts._

3. Third: run SetupTheCompiler.sh

_It will build the Swift Compiler and its toolchain, using the presets by @jinmingjian. It might take a good while._

4. Fourth: run SourceKiteAndSDE.sh

_It will download and build the last piece required for SDE to work: **sourcekite**_
