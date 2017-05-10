# Prolog shell scripts

## Usage

Run keys.pl script

```
./run.pl keys.pl /path/to/file.json
```

## Writing scripts

run.pl script assumes that there exists execute/0 predicate in file given
as first parameter to run.pl script. After script is loaded then execute
predicate is called.

