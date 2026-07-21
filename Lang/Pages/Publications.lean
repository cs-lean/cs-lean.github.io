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

instance : Coe String Author where
 coe name := ⟨name, none⟩

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
def christopher : Author := ⟨"Christopher Henson", none⟩

end Authors

open Authors

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
  },
  { title := "Computer Science as Infrastructure: the Spine of the Lean Computer Science Library (CSLib)"
    authors := [christopher, fabrizio]
    links := [⟨"arXiv", "https://arxiv.org/abs/2602.15078"⟩]
    info := "arXiv:2602.15078, 2026"
  }
]

def pubList : Html := {{
  <ul class="publications">
    {{pubs.map (·.toHtml) |>.map li }}
  </ul>
}}

def videoEmbed : Html := {{
  <iframe width="560" height="315"
    src="https://www.youtube.com/embed/videoseries?si=hnkmv4VJwttdpXvu&list=PLtlBXrgM1AlPIFwMaM2eDaIyK03z3Hxk-"
    title="YouTube video player" frameborder="0"
    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
    referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe>
}}

#doc (Page) "News & Resources" =>

%%%
showInNav := true
%%%

# API Documentation

For the library's API reference, see the [API documentation](https://leanprover.github.io/cslib/docs/). It is kept in sync as the library evolves.

# CSLib Community Meetings

:::blob videoEmbed
:::

# Papers

:::blob pubList
:::
