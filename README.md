# Swift@Linux Setup
_Shell Scripts and instructions on how to set up Swift on Linux._

**TODO: vscode apt get issue link, script naming, change toolkit to toolchain.**

Follow the Steps:

## 0) Pre-requisites 

These scripts are intended for use in Ubuntu 16.04. If you're *not* running 16.04 or a derivative, you've been warned.

Apart from running Ubuntu 16.04, you'll need `git`. Open your Terminal (Ctrl + Alt + T) and run:

```bash

sudo apt-get install git

```

And after that, clone this repo:

```bash

git clone https://github.com/felix91gr/swift-linuxSetup.git

```

With that, you're ready to start with the *real* setup.

## 1) Basic dependencies

You'll need certain **dependencies** to install the Swift Toolchain. To have them, run the script Prereq.sh and that's it:

```bash

./Prereq.sh

```

## 2) Install the toolchain

You can compile the toolchain if you want to. But since we'll need Swift 3.1, which is still in development, is hard to reliably compile it. **Instead,** we're gonna use the precompiled 3.1 toolchain, available at [swift.org](swift.org).

For that, run the next script:

```bash

./Alternative-Compiler.sh

```
Now you should be able to use the Swift REPL (interactive Swift terminal). Test it, closing the current terminal and opening a new one:

```bash

swift

```

You should see the following prompt:

```console
Welcome to Swift version 3.1-dev (LLVM 04d780b9be, Clang 5fd2455004, Swift ccffbcd31a). Type :help for assistance.
  1>
```
If you wanna know how and why to use the REPL, go [here](https://swift.org/lldb/#why-combine-the-repl-and-debugger). To exit the REPL, press `Ctrl + D`.

If all went well, now you're ready to use Swift in Linux. If you want to setup the SDE (Swift Development Environment), follow the rest of the tutorial.

## 3) SDE

[SDE](https://github.com/jinmingjian/sde), or Swift Development Environment, is a great plugin for Swift development in Linux using VSCode. It is made and mantained by the awesome [Jin Ming Jian](https://github.com/jinmingjian). It features:

* Syntax highlighting
* Autocomplete
* Error checking and highlighting

For now, I can only provide the *Docker-based* steps. Sorry about that, when I manage to reliably have a *native* install of SDE, I will post it here. Given that Swift 3.1 is around the corner, it should get easier to get it done correctly the native way. 

Anyway. Let's get to it.

### 3.1) Docker

You'll need Docker for this. Docker is a lightweight virtualization tool, which allows us to have a linux VM with high performance and low memory and CPU footprint. We'll use it to have a *Docker Container* which will run **Source Kite**, the backend of SDE.

But first, we'll have to install and configure Docker. For that, run:

```bash

./DockerAndSourceKite.sh

```
If it worked, you should see the output of the hello-world docker command. If it did work, you should now log out and log back in to manifest the changes in your user privileges (*basically, you won't need the __sudo__ keyword to use docker commands*)

### 3.2) Source Kite

**Source Kite** is the backend for SDE. It allows SDE to interface with the SourceKit libraries provided by the Swift toolchain. [Here](https://github.com/jinmingjian/sourcekite) you can look at the sourcecode.

But for this tutorial, we'll use a docker image of Source Kite that Jin made available (Thank you Jin! You're the best ^^). To download and test it, run:

```bash
./SourceKiteFromDocker.sh
```

### 3.3) VSCode and SDE

We're almost there! All that is left of the scripts is to set up apt-get to download and update VSCode from the repositories (thanks to [these people](link)). After that, you'll only have to download and configure the SDE plugin in VSCode

For VSCode, run:

```bash
./InstallVSCode.sh
```

#### AQUI QUEDÉ. FALTA:

* INSTALACIÓN DE SDE EN VSCODE
* CONFIGURACIÓN DE SDE PARA QUE USE SOURCEKITE DESDE DOCKER
* CONFIGURACIÓN DE LA OTRA WEA DE SDE PARA QUE USE EL SWIFT COMPILER
* CREACIÓN DE UN COMANDO DE SWIFT BUILD PARA QUE VSCODE COMPILE
* MINI TUTORIAL CON EL PROYECTO DE EJEMPLO DE JIN.

### Fourth: run `SourceKiteAndSDE.sh`

_It will download and build the last piece required for SDE to work: **sourcekite**_

## Alternative Setup

You can replace the third step by using the script `AlternativeCompiler.sh`. That will download ready-to-use binaries from one of the latest snapshopts of **Swift 3.1**
