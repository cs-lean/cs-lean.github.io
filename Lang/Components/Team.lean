import VersoBlog

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

def team (teamMembemr : Member) : HtmlM Page Html := do
  saveCss (include_str "../../static/css/team.css")
  return {{
    <div class="team-card" onclick="toggleCard(this)">
        <div class="image-container">
            <img src={{teamMembemr.url}}/>
        </div>
        <div class="content-area">
            <div class="member-details">
                <div class="member-name">{{teamMembemr.name}}</div>
                <p class="member-role">{{teamMembemr.role}}</p>
            </div>
        </div>
    </div>
  }}
