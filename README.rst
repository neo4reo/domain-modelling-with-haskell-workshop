Domain Modelling with Haskell Workshop
======================================

Welcome to the “Domain Modelling with Haskell” workshop, based off the
screencast series from `Haskell at
Work <https://haskell-at-work.com>`__. This document contains the
instructions, exercises, and references for you to get started with
Haskell and domain modelling, in the example domain of *project
management*.

**The properly rendered version of this document is hosted at:**

https://owickstrom.github.io/domain-modelling-with-haskell-workshop/

Do not read directly at GitHub.

Introduction
------------

We will model a simple project management system, and implement
*reporting* functionality based on our core data structures. The
sections in this workshop explore increasingly abstract techniques for
working with Haskell data structures. We begin with regular Haskell data
structures, monoids, and explicit recursion.

Setup
-----

Installing Stack
~~~~~~~~~~~~~~~~

If you don’t have any strong preferences on your Haskell installation,
and just want to get going, it is recommended to use
`Stack <https://haskellstack.org>`__ to install the Haskell compiler,
the required libraries, and compiling the code. The website has the
installation instructions on the home page.

If you do install GHC and Cabal in another way, do consider using Cabal
``new-build``, a sandbox, or some other means of isolating the build.

Cloning and Installing Dependencies
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To get you up and running, begin by cloning this repository to your
local machine:

.. code:: sh

    $ git clone https://github.com/owickstrom/domain-modelling-with-haskell-workshop.git
    ...
    $ cd domain-modelling-with-haskell-workshop

Then, install all dependencies required, and build the project:

.. code:: sh

    $ stack build

The Cabal file for this project has a number of library dependencies
already, so that you can have them installed beforehand, and complete
the workshop without an (or with a flaky) internet connection.

All right! If all went well, you are ready to get started. You may edit
Haskell files in any text editor you like. If you don’t have any strong
preference, both `VS Code <https://code.visualstudio.com/>`__ and
`Atom <https://atom.io/>`__ are easy to get started with.

Setting up Haskell tooling is way out of the scope of this workshop, and
you will not need anything fancy. We will load and test the code in GHCi
(a REPL) anyway.

Part 1: Data Structures
-----------------------

We will begin by laying the groundwork for our system. The concepts
and features that we need in the project management system are
described informally below. The "things" should be modelled as data
types, and "operations" as functions (possibly with `IO`.)

*Project*

  The core concept in the system is a *project*. A project can be
  either a single project or a project group. Both single projects and
  project groups have *names*, and single projects also have *project
  IDs*, which are natural numbers. A project group has a list of child
  projects.

  **Note:** project IDs can be wrapped in a `newtype` instead of
   using a "raw" numeric type, making it more informative and safer to
   pass around in the code.

*Budget*

  A budget describes the expected *income* and *expenditure* for a
  project, both being monetary values.

*Transaction*

  A transaction is a very simplified concept describing a *sale* or a
  *purchase*. Each type of transaction has an amount (a monetary
  value.)

*Get budget by project ID* (query)

  Given a project ID, we need to be able to retrieve a budget for the
  corresponding project.

  **Note:** To save time, hard-code or generate a random result,
   instead of using a real persistent database.

*Get transactions by project ID* (query)

  Given a project ID, we need to be able to retrieve a list of
  transactions for the corresponding project.

  **Note:** To save time, hard-code or generate a random result,
   instead of using a real persistent database or querying an external
   system.

*Report*

  A report represents the result of the *report calculation*. It has:

  * a *budget profit*, where :math:`\text{budget profit} = \text{income} - \text{expenditure}`
  * a *net profit*, where :math:`\text{net profit} = \text{sales} - \text{purchases}`, and
  * a *difference*, where :math:`\text{difference} = \text{net
    profit} - \text{budget profit}`.

Domain Modelling Screencasts
----------------------------

This repository contains the source code for “Domain Modelling with
Haskell,” a series of screencasts on `Haskell at
Work <https://haskell-at-work.com>`__. You will find each episode’s
result among these branches:

1. ``data-structures``
2. ``foldable-traversable``
3. ``writert``
4. ``fixplate`` (you are here)
