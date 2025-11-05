import Lean.Elab

import VersoBlog

open Lean Elab Term
open Lean.Doc.Syntax

open Verso Genre Blog ArgParse Doc Elab

namespace Lang
namespace Components

local elab "fileContents(" s:str ")" : term => do
  let s ← IO.FS.readFile s.getString
  return toExpr s

private def glightboxJs : String × String :=
  ("glightbox.min.js",
   fileContents("deps/glightbox/js/glightbox.min.js"))

private def glightboxCss : String × String :=
  ("glightbox.css",
   fileContents("deps/glightbox/css/glightbox.css"))

private def galleryJs : String × String :=
  ("gallery.js",
   fileContents("static/js/glightbox.js"))

private def galleryCss : String × String :=
  ("gallery.css",
   fileContents("static/css/gallery.css"))


open Output.Html in
open Traverse in
/--
A screenshot gallery.

The syntax of the gallery should be a directive that contains a description list. Terms in the
description list should be images, while the descriptions should be the images' captions.
-/
block_component gallery where
  cssFiles := #[glightboxCss, galleryCss]
  jsFiles := #[glightboxJs, galleryJs]

  toHtml _id _json _goI goB contents := do
    let «class» := if contents.size == 1 then "screenshot" else "gallery"
    pure {{
      <div class={{«class»}}>
        {{← contents.mapM goB}}
      </div>
    }}

private def keepAlphaNum (s : String) : String := Id.run do
  let mut out := ""
  let mut iter := s.iter
  while !iter.atEnd do
    let c := iter.curr
    if c.isAlphanum then out := out.push c
    iter := iter.next
  out

open Output.Html in
block_component galleryItem (name url title : String) where
  toHtml _ _ _ goB contents := do
    let descClass := "desc--" ++ keepAlphaNum title
    pure {{
      <div class="gallery-item">
        <a href={{url}}
           data-gallery={{name}}
            data-glightbox=s!"title: {title}; description: .{descClass}">
          <img src={{url}} alt={{title}}/>
        </a>
      </div>
      <div class=s!"{descClass} glightbox-desc">
        {{← contents.mapM goB}}
      </div>
    }}

/--
Translates an item of a description list into a gallery item component.
-/
private def getItem (name : String) : Syntax → DocElabM (TSyntax `term)
  | `(desc_item|: $dts* => $dds*) => do
    let #[img] := dts.filter fun
        | `(inline|$s:str) => s.getString.any (!·.isWhitespace)
        | _ => true
      | throwErrorAt (mkNullNode dts.raw) "Expected a single image, got {dts}"
    let `(inline|image($title)$dest) := img
      | throwErrorAt img "Expected an image, got {img}"
    let title := title.getString
    let `(link_target|( $url:str )) := dest
      | throwErrorAt dest "Expected URL, got {dest}"

    ``(galleryItem $(quote name) $(quote url.getString) $(quote title) #[$[$(← dds.mapM elabBlock)],*])

  | other => throwErrorAt other "Failed to parse description list item"

@[directive_expander gallery, inherit_doc gallery]
def galleryDir : DirectiveExpander
  | args, #[block] => do
    let name ← ArgParse.run (.positional `name .string) args
    match block with
    | `(block|dl{$item*})=>
      let items ← item.mapM (getItem name)
      pure #[← ``(gallery #[$items,*])]
    | other => throwErrorAt other "Expected a description list"
  | _, more => do
    if h : more.size > 1 then
      throwErrorAt more[1] "Expected only a single block"
    else throwError "Expected a block"

end Components
end Lang
