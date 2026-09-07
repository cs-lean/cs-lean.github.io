import VersoBlog

import Lang.Components.Feature

open Verso Genre Blog
open Verso Doc Elab ArgParse
open Lean
open Verso Output Html
open Template

namespace Lang
namespace Components

structure Member where
  url : String
  name : String
  role : String
  link : Option String := none

def team (member : Member) : HtmlM Page Html := do
  saveCss (include_str "../../static/css/team.css")
  let webLink :=
    if let some link := member.link then {{
      <a href={{link}} title=s!"{member.name}'s website" class="member-link">{{ Icon.link (fill := "var(--color-text)") (width := "18") }}</a>
    }} else ""
  return {{
    <div class="team-card" onclick="toggleCard(this)">
        <div class="image-container">
            <img src={{member.url}}/>
        </div>
        <div class="content-area">
            <div class="member-details">
                <div class="member-name"><span>{{member.name}}</span>{{webLink}}</div>
                <p class="member-role">{{member.role}}</p>
            </div>
        </div>
    </div>
  }}
