import Lake
open Lake DSL

require verso from git "https://github.com/leanprover/verso" @ "main"
require subverso from git "https://github.com/leanprover/subverso" @ "main"

package cslibwebsite where
  moreLeancArgs := #["-O0"]
  moreLinkArgs :=
    if System.Platform.isOSX then
      #["-Wl,-ignore_optimization_hints"]
    else #[]

lean_lib Lang where
  needs := #[`@/static]

@[default_target]
lean_exe «cslib» where
  root := `Lang
  supportInterpreter := true
  needs := #[`@/static]

input_dir static where
  path := "static/"
  text := true
  filter := .extension (#["css", "js", "svg"].contains ·)

script generate (args) do
  if !args.isEmpty then
    IO.eprintln "No args expected"
    return 1

  let code ← IO.Process.Child.wait 
    <| ← IO.Process.spawn {cmd := "lake", args := #["exe", "cslib", "--output", "_cslib.org"]}
  if code != 0 then
    return code

  IO.FS.writeFile  "./_cslib.org/404.html" (← IO.FS.readFile "./_cslib.org/404/index.html")

  return 0
