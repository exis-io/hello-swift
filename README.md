<div align="center">
    <h1>Join the Chat!
    <br>
    <a href="http://slack.exis.io"><img src="http://slack.exis.io/badge.svg"></a>
    </h3>
</div>

# Hello World for Exis

This is an example Swift project for Exis.  You can run it on your own Linux
machine if you have Docker installed.

    docker build -t exis-hello-swift .
    docker run -t exis-hello-swift

Visit www.exis.io to learn how to host it on Exis!

# Project Structure

File                   | Purpose
---------------------- | -----------------------------------------------------------
Backend/main.swift     | is the entry point for the example code.
Backend/Package.swift  | lists dependencies including Riffle.
Run.yaml               | tells us how to execute your code on Exis.
Dockerfile             | can be used for local testing if you have Docker installed.

## Package.swift

The Swift package manager is still under heavy development.  Follow these
simple conventions to ensure that your code will compile for Exis.

1. Surround the contents with a `#if os(Linux)`/`#endif` block to avoid errors
   in Xcode.
2. Do not set a name for the package.  In that way the compiler will default to
   building an executable with the same name as the directory containing your
   main.swift.
3. Be sure to list Riffle as a dependency
   (https://github.com/exis-io/swiftRiffleUbuntu.git).

## Run.yaml

The Run file tells Exis how to execute your code.  Minimally, it should
have two lines.  In the following example, "Base: exis-swift:r4" tells us
that you are using Swift with the fourth version of the Exis base image.
We try not to change the base images very often, but specifying the
version means your code will continue working long after you have
tested it.  The second line, "Command: Backend" tells us that your
executable will be named "Backend", which for Swift, should also match
the name of the directory containing your main.swift file.

```
Base: exis-swift:r4
Command: Backend
```

## Dockerfile

The Dockerfile is optional and is provided so that you can test on your own
machine.  If you are hosting on Exis, we will use your Run file instead.

If you have installed on your computer, you can run the `docker build`
and `docker run` commands listed above.
