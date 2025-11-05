import Lean.Elab
import VersoBlog

open Verso Genre
open Verso.Output Html

namespace Lang
namespace Components

/--
This is a method of grouping things inside of a `.seq` inside a Page or Post.
-/
block_component +directive container where
  toHtml _ _ _ goB contents := contents.mapM goB

end Components
end Lang
