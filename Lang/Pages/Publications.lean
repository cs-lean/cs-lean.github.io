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

namespace Authors

def kha : Author := ⟨"Sebastian Ullrich", some "https://pp.ipd.kit.edu/~ullrich/"⟩
def leo : Author := ⟨"Leonardo de Moura", some "http://leodemoura.github.io/"⟩
def dselsam : Author := ⟨"Daniel Selsam", none⟩
def gebner : Author := ⟨"Gabriel Ebner", some "https://gebner.org/"⟩
def jroesch : Author := ⟨"Jared Roesch", some "http://jroesch.github.io/"⟩
def avigad : Author := ⟨"Jeremy Avigad", some "http://www.andrew.cmu.edu/user/avigad"⟩
def floris : Author := ⟨"Floris van Doorn", some "https://florisvandoorn.com/"⟩
def jakob : Author := ⟨"Jakob von Raumer", some "http://von-raumer.de/"⟩
def cody : Author := ⟨"Cody Roux", some "https://www.kleene.church/"⟩
def soonho : Author := ⟨"Soonho Kong", some "http://www.cs.cmu.edu/~soonhok"⟩

end Authors

open Authors

instance : Coe String Author where
  coe name := ⟨name, none⟩

def pubs : Array Publication := #[
  { title := "An Extensible Theorem Proving Frontend"
    authors := [kha]
    links := [.pdf "/papers/thesis-sebastian.pdf"]
    info := "PhD Thesis, Karlsruhe Institute of Technology, Germany, 2023"
  },
  { title := "‘do’ Unchained: Embracing Local Imperativity in a Purely Functional Language (Functional Pearl)"
    authors := [kha, leo]
    links := [.pdf "/papers/do.pdf", ⟨"Supplement repository", "https://github.com/Kha/do-supplement"⟩]
    info := "27th ACM SIGPLAN International Conference on Functional Programming (ICFP 2022), Ljubljana, Slovenia, 2022"
  },
  { title := "The Lean 4 Theorem Prover and Programming Language"
    links := [.pdf "/papers/lean4.pdf"]
    authors := [leo, kha]
    info := "28th International Conference on Automated Deduction (CADE-28), Pittsburgh, USA, 2021"
  },
  { title := "Tabled Typeclass Resolution"
    links := [.pdf "https://arxiv.org/pdf/2001.04301.pdf"]
    authors := [dselsam, kha, leo]
    info := "draft, 2020"
  },
  { title := "Beyond Notations: Hygienic Macro Expansion for Theorem Proving Languages"
    links := [.pdf "https://arxiv.org/pdf/2001.10490.pdf"]
    authors := [kha, leo]
    info := "10th International Joint Conference on Automated Reasoning (IJCAR 2020), Paris, France, 2020"
  },
  { title := "Counting Immutable Beans: Reference Counting Optimized for Purely Functional Programming"
    links := [.pdf "https://arxiv.org/abs/1908.05647", ⟨"Appendix", "/papers/beans_appendix.pdf"⟩]
    authors := [kha, leo]
    info := "The 31st symposium on Implementation and Application of Functional Languages (IFL 2019), Singapore, 2019"
  },
  { title := "A Metaprogramming Framework for Formal Verification."
    links := [.pdf "/papers/tactic.pdf"]
    authors := [gebner, kha, jroesch, avigad, leo]
    info := "22nd ACM SIGPLAN International Conference on Functional Programming (ICFP 2017), Oxford, UK, 2017"
  },
  { title := "Developing Bug-Free Machine Learning Systems With Formal Mathematics."
    links := [⟨"arXiv", "https://arxiv.org/abs/1706.08605"⟩, ⟨"Source code", "https://github.com/dselsam/certigrad"⟩]
    authors := [dselsam, "Percy Liang", "David L. Dill"]
    info := "Thirty-fourth International Conference on Machine Learning (ICML) 2017"
  },
  { title := "Congruence Closure in Intensional Type Theory"
    links := [.pdf "/papers/congr.pdf"]
    authors := [dselsam, leo]
    info := "International Joint Conference on Automated Reasoning (IJCAR), Coimbra, Portugal, 2016"
  },
  { title := "The Lean Theorem Prover."
    links := [.pdf "/papers/system.pdf"]
    authors := [leo, soonho, avigad, floris, jakob]
    info := "25th International Conference on Automated Deduction (CADE-25), Berlin, Germany, 2015"
  },
  { title := "Elaboration in Dependent Type Theory."
    links := [.pdf "https://arxiv.org/pdf/1505.04324.pdf"]
    authors := [leo, avigad, soonho, cody]
    info := "A description of the elaborator used in Lean 2 only"
  }
]

def pubList : Html := {{
  <ul class="publications">
    {{pubs.map (·.toHtml) |>.map li }}
  </ul>
}}

#doc (Page) "Publications" =>

%%%
showInNav := false
%%%

This is a list of papers and presentations about Lean by the Lean developers. For further publications about Lean, the mathlib library, and other formalizations in Lean, please also see [the Lean community website](https://leanprover-community.github.io/papers.html).

# Papers

:::blob pubList
:::

# Presentations

- [Lean: Past, Present, and Future](/talks/fscd2024.pdf), [FSCD 2024](https://cs.ioc.ee/fscd24/), July 2024

- [Profiling Tools in Lean](/talks/lmu2024.pdf), LMU, June 2024

- [Lean Together 2024](https://leanprover-community.github.io/lt2024/schedule.html), January 2024
  - Sebastian Ullrich: [Are We Fast Yet](/talks/LT2024-sebastian.pdf).

- [Machine-Checked Proofs and the Rise of Formal Methods in Mathematics](/talks/simons2023.pdf), [video](https://www.youtube.com/watch?v=ekYeqvMcaWQ&list=PLgKuh-lKre11Hkeo5UnqhYZzY35Y70z5y), [Simons Institute](https://simons.berkeley.edu/events/machine-checked-proofs-rise-formal-methods-mathematics-theoretically-speaking), Berkeley, October 2023.

- [Lean 4: an extensible proof assistant and programming language](/talks/lean_itp_summer_school_2023.pdf), [ITP Summer School](https://itp-school-2023.github.io/program), September 2023.

- [Lean 4: Empowering the Formal Mathematics Revolution and Beyond](https://www.youtube.com/watch?v=rDe0nIHINXs&t=28s), [Topos Institute](https://topos.institute/), September 2023.

- [The Lean Focused Research Organization](/talks/lftcm2023.pdf), [Lean for the Curious Mathematician 2023](https://lftcm2023.github.io/), September 2023.

- [Scaling Lean to the Next Millions of Lines of Proofs](/talks/WITS2023.pdf), [WITS 2023](https://ifl23.github.io/wits.html), August 2023.

- [Syntax Extensibility in Lean 4](/talks/Edinburgh2023.pdf), [University of Edinburgh](https://www.ed.ac.uk/), June 2023.

- [Metaprograms and Proofs: Macros in Lean 4](/talks/RacketCon2022.pdf), [RacketCon 2022](https://con.racket-lang.org/), October 2022.

- [‘do’ Unchained: Embracing Local Imperativity in a Purely Functional Language (Functional Pearl)](/talks/icfp2022.pdf) [\[video\]](https://youtu.be/nqBVYQh6Lxo), [ICFP 2022](https://icfp22.sigplan.org/), September 2022.

- [Lean 4](/talks/ICERM-2022.pdf), [Lean for the Curious Mathematician](https://icerm.brown.edu/topical_workshops/tw-22-lean/), [\[video\]](https://icerm.brown.edu/video_archive/?play=2906), July 2022.

- [An Introduction to the Lean 4 theorem prover and programming language](/talks/NFM2022.pdf), [NASA Formal Methods Symposium](https://nfm2022.caltech.edu/), May 2022.

- [Gotta Prove Fast: Building an Ecosystem for Effortless Native Compilation of Tactics](/talks/WITS2022.pdf) [\[video\]](https://youtu.be/Tn74XMuTyM8), [Workshop on the Implementation of Type Systems 2022](https://popl22.sigplan.org/home/wits-2022), January 2022.

- Metaprogramming in Lean 4 [\[slides pt. 1\]](https://leanprover-community.github.io/lt2021/slides/sebastian-lean4-parsers-macros.pdf) [\[slides pt. 2\]](https://leanprover-community.github.io/lt2021/slides/leo-LT2021-meta.pdf) [\[video\]](https://www.youtube.com/watch?v=hxQ1vvhYN_U) [\[video cont.\]](https://www.youtube.com/watch?v=vy4JWIiiXSY), [Lean Together 2021](https://leanprover-community.github.io/lt2021/), January 2021.

- An overview of Lean 4 [\[slides pt. 1\]](https://leanprover-community.github.io/lt2021/slides/leo-LT2021.pdf) [\[slides pt. 2\]](https://leanprover-community.github.io/lt2021/slides/sebastian-An-Overview-of-Lean-4-Demo.pdf) [\[video\]](https://www.youtube.com/watch?v=UeGvhfW1v9M), [Lean Together 2021](https://leanprover-community.github.io/lt2021/), January 2021.

- [Beyond Notations: Hygienic Macro Expansion for Theorem Proving Languages](/talks/ijcar2020.pdf) [\[video\]](https://www.youtube.com/watch?v=34jZTv0Gla8), [IJCAR 2020](https://ijcar2020.org/), July 2020.

- [Lean 4](/talks/LeanPLDI.pdf) [\[video\]](https://youtu.be/TgHISG-81wM), [PLDI 2020](https://conf.researchr.org/home/pldi-2020), June 2020.

- [Lean in Lean](/talks/LeanACL2.pdf), [ACL2 workshop](http://acl2-2020.info/), May 2020.

- [Lean 4: State of the ⋃](/talks/cmu2020.pdf) [\[video\]](https://youtu.be/yAizjui7CKA), [Formal Methods in Mathematics / Lean Together 2020](http://www.andrew.cmu.edu/user/avigad/meetings/fomm2020/), Pittsburgh, January 2020.

- [Counting Immutable Beans: Reference Counting Optimized for Purely Functional Programming](/talks/IFL2019.pdf), [IFL 2019](http://web.archive.org/web/20200927054840/http://2019.iflconference.org/), Singapore, September 2019.

- [Lean 4: a guided preview](/talks/vu2019.pdf), [Lean Together 2019](https://lean-forward.github.io/lean-together/2019/index.html), Amsterdam, January 2019.

- [An optimized object model for an interactive theorem prover](/talks/eth2018.pdf) [\[video\]](https://www.youtube.com/watch?v=Bv0CXyhbJ5s), ETH Compiler Social, Zurich, December 2018.

- [Lean 4: reimplementing Lean in Lean](/presentations/20181012_MSR/), internship report, Redmond, October 2018.

- [Lean: past, present and future](/talks/LeanAtGalois.pdf), Galois Inc., Oregon, August 2018.

- [Efficient verification and metaprogramming in Lean](/talks/FM2018.pdf), [22nd International Symposium on Formal Methods](http://www.fm2018.org/), Oxford, July 2018

- [White-box automation](/talks/ITP2017.pdf), [International Conference on Interactive Theorem Proving](http://itp2017.cic.unb.br/), Brasilia, September 2017

- [From Z3 to Lean](/talks/from_z3_to_lean.pdf), [The Alan Turing Institute](https://www.turing.ac.uk/), London, July 2017

- [Metaprogramming with Dependent Type Theory](/talks/Lean_BPR.pdf), [Issac Newton Institute for Mathematical Sciences](https://www.newton.ac.uk/event/bpr), Cambridge, July 2017

- [The Lean Theorem Prover](/presentations/20170116_POPL/), [POPL'17](http://popl17.sigplan.org/), Paris, January 2017

- [Formal Methods in Mathematics and the Lean Theorem Prover](/talks/stanford2017.pdf), [CSLI](https://www-csli.stanford.edu/), Stanford, January 2017

- [The Lean Theorem Prover](/presentations/20161024_ICTAC/), [ICTAC'16](http://cc.ee.ntu.edu.tw/~ictac2016), Taipei, Taiwan, October 2106

- [The Lean Theorem Prover and Automation](/presentations/20160119_CPP/), [CPP'16](https://people.csail.mit.edu/adamc/cpp16/index.html), St. Petersburg, Florida, January 2016

- [Type Theory and Practical Foundations (with examples in Lean)](http://www.andrew.cmu.edu/user/avigad/Talks/fields_type_theory.pdf), [Fields Institute](http://www.fields.utoronto.ca/), Toronto, February 2016

- [The Lean Theorem Prover (CADE system description)](/presentations/20150807_CADE/) [CADE'25](https://conference.imp.fu-berlin.de/cade-25/home), Berlin, Germany, August 2015

- [Lean CADE Tutorial](/presentations/20150803_CADE/), [CADE'25](https://conference.imp.fu-berlin.de/cade-25/home), Berlin, Germany, August 2015

- [The Lean Theorem Prover](/presentations/20150717_CICM/), [CICM](http://cicm-conference.org/2015/cicm.php), Washington D.C., July 2015

- [The Lean Theorem Prover](/presentations/20150218_MSR/), PL(X) meeting at [Microsoft Research](http://research.microsoft.com/en-us/groups/rise/), February 2015

# Developer update meetings

- [May 10th 2024](/talks/community-meeting-may-2024.pdf) [\[video\]](https://youtu.be/sJipZYPKX6Q)

- [Nov 21th 2023](/talks/community-meeting-nov-2023.pdf) [\[Standard Library slides\]](/talks/community-meeting-nov-2023-std.pdf) [\[video\]](https://youtu.be/4IDrPL4I_bU)

- [Oct 13th 2023](/talks/community-meeting-oct-2023.pdf) [\[video\]](https://youtu.be/jaibFnoMDSw)

- [June 15th 2022](/talks/lean-update-2022-06-15.pdf)
