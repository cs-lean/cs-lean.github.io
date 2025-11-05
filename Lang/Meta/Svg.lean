import Lean
import Verso.Doc.Html

open Verso.Output Html
open Lean Elab Term IO Meta PrettyPrinter Delaborator SubExpr

namespace Lang
namespace Meta

syntax "svg(" str ")" : term

elab "svg(" filePath: str ")" : term => do
  let content ← FS.readFile filePath.getString
  let env ← getEnv

  let .ok stx := Parser.runParserCategory env `html content
    | throwError "Failed to parse SVG file: {filePath.getString}"

  let stx := ⟨stx⟩

  elabTerm (← `({{ $stx }})) none
