import Verso.Doc.Elab
import VersoBlog

open Verso.Genre.Blog (Page blob)
open Verso.Output Html

def li (elem : Html) : Html := {{<li>{{elem}}</li>}}

structure Link where
  name : String
  url : String

def Link.pdf (url : String) : Link := ⟨"PDF", url⟩

def Link.toHtml (link : Link) : Html :=
  {{ <a href={{link.url}}>{{link.name}}</a> }}

structure Author where
  name : String
  url : Option String := none

def Author.toHtml (author : Author) : Html :=
  match author.url with
  | none => author.name
  | some u => {{ <a href={{u}}>{{author.name}}</a> }}

def authorList : List Author → Html
  | [] => .empty
  | authors => {{<ol class="authors">{{authors.toArray.map (li <| ·.toHtml)}}</ol>}}

structure Publication where
  title : String
  links : List Link
  authors : List Author
  /-- Venue, etc -/
  info : String

def Publication.toHtml (pub : Publication) : Html := {{
  <span class="publication">
    <span class="title">{{pub.title}}</span>" "<ul class="links">{{pub.links.toArray.map (li <| ·.toHtml)}}</ul>
    {{authorList pub.authors}}
    <span class="info">{{pub.info}}</span>
  </span>
}}

instance : Coe String Author where
  coe name := ⟨name, none⟩

namespace Authors

def clark : Author := ⟨"Clark Barrett", some "https://theory.stanford.edu/~barrett/"⟩
def swarat : Author := ⟨"Swarat Chaudhuri", some "https://www.cs.utexas.edu/~swarat/"⟩
def fabrizio : Author := ⟨"Fabrizio Montesi", some "https://www.fabriziomontesi.com/"⟩
def jim : Author := ⟨"Jim Grundy", none⟩
def pushmeet : Author := ⟨"Pushmeet Kohli", none⟩
def alexandre : Author := ⟨"Alexandre Rademaker", some "https://arademaker.github.io/"⟩
def sorrachai : Author := ⟨"Sorrachai Yingchareonthawornchai", none⟩
def leo : Author := ⟨"Leonardo de Moura", some "http://leodemoura.github.io/"⟩
def marco : Author := ⟨"Marco Peressotti", some "https://marcoperessotti.com/"⟩

end Authors

open Authors

instance : Coe String Author where
 coe name := ⟨name, none⟩

def pubs : Array Publication := #[
  { title := "CSLib: The Lean Computer Science Library"
    authors := [clark, swarat, fabrizio, jim, pushmeet, leo, alexandre, sorrachai]
    links := [⟨"arXiv", "https://arxiv.org/abs/2602.04846"⟩]
    info := "arXiv:2602.04846, 2026"
  },
  { title := "Hennessy-Milner Logic in CSLib, the Lean Computer Science Library"
    authors := [fabrizio, marco, alexandre]
    links := [⟨"arXiv", "https://arxiv.org/abs/2602.15409"⟩]
    info := "arXiv:2602.15409, 2026"
  }
]

def pubList : Html := {{
  <ul class="publications">
    {{pubs.map (·.toHtml) |>.map li }}
  </ul>
}}

#doc (Page) "Learning Resources" =>

%%%
showInNav := true
%%%

# API Documentation

For the library's API reference, see the [API documentation](https://leanprover.github.io/cslib/docs/). This documentation is automatically updated on every new commit to the library's main branch.

# Papers

:::blob pubList
:::
