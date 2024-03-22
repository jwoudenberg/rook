interface Local
    exposes [
        # API
        onCliCommand,

        # Internals
        run,
    ]
    imports [
        pf.Task.{ Task },
        Job.{ Job },
    ]

onCliCommand : Str, Job -> (Hook *, Job)

Hook a : [CliCommand Str]a

run : List (Hook *, Job), List Str -> Task {} *
