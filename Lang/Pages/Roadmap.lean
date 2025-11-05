import VersoBlog

import Lang.Components.Container
import Lang.Components.ZulipInfo

open Verso.Genre Blog Theme Template
open Verso.Output Html
open Lang.Components

open Verso.Genre.Blog (Page)

#doc (Page) "Roadmap" =>

# Roadmap

While this proposal seeks two years of funding, we include below a three-year roadmap for context and transparency.
This is a conservative roadmap—we hope to move more quickly if possible.

1. *Formalizing CS Foundations*

   - *6 Months:* Basic models of computation such as lambda-calculus and Turing machines defined, as well as basic machinery for complexity analysis of algorithms written in Boole.
   - *1 Year:* Extension of formalization base into one covering all proofs in an undergraduate algorithms text.
   - *18 Months:* Extending the base so that it can handle arguments (including randomization- and approximation-based arguments) commonly used to analyze research-level algorithms, as well as semantic machinery (such as concurrent separation logic or specific modal logics) needed to verify real-world systems.
   - *2 Years:* Demonstration of our machinery in the task of fully formalizing a nontrivial set of theoretical CS papers.
   - *30 Months:* Extension and application of our machinery to proofs of several real-world systems.
   - *3 Years:* Mature framework that can be used to formalize and prove all arguments in a typical CS theory paper and a typical real-world system verification project.

2. *Reasoning about Code*

   - *6 Months:* First version of Boole defined, with the ability to use Lean constructs in specifications and with support for cost semantics.
   - *1 Year:* First version of Boole backend complete, with a limited TCB and with a selection of hammers for automation.
   - *18 Months:* Extensions to Boole for concurrency and low-level code.
   - *2 Years:* More mature backend. TCB limited to semantics of Boole and the Lean kernel. Most Boole programs verified automatically via sophisticated hammers, including AI hammers.
   - *30 Months:* Prototype verification system for a real programming language (e.g., Python, Rust) using Boole as an IVL.
   - *3 Years:* Full *CSLib* pipeline for a real programming language with a minimal TCB and with a high level of proof automation.

3. *Repository of Verified Code*

   - *6 Months:* A few sample algorithms implemented in Boole.
   - *1 Year:* A full algorithms textbook formalized in Boole.
   - *18 Months:* Samples of concurrent and low-level programs formalized in Boole.
   - *2 Years:* Extensive library for foundational CS formalized, including algorithms at different levels of abstraction.
   - *30 Months:* Sample programs in real programming languages formalized and proved using *cslib*.
   - *3 Years:* A significant real system verified using *CSLib*.
