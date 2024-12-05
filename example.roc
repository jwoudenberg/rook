module [main]

# Application example

main =
    { pipeline <-
        setupGit: step0 setupGit,
        buildBinary: step1 buildBinary .setupGit,
        runTests: step1 runTests .buildBinary,
        release: step2 release .buildBinary .runTests,
    }

buildBinary : RepoDetails => Result File Error

runTests : File => Result {} Error

release : File, {} => Result {} Error

# Library

Ci steps a := {}

pipeline : Ci steps a, Ci steps b, (a, b -> c) -> Ci steps c

step0 : ({} => Result a Error) -> Ci steps a

step1 : (a => Result b Error), (steps -> a) -> Ci steps b

step2 : (a, b => Result c Error), (steps -> a), (steps -> b) -> Ci steps c

Error := Str

Dir : Str

File : Str

RepoDetails : { gitRoot : Dir }

setupGit : {} => Result RepoDetails Error
