
<!--#echo json="package.json" key="name" underline="=" -->
ghaction-lua-contemn-stray-globals
==================================
<!--/#echo -->

<!--#echo json="package.json" key="description" -->
A GitHub action that verifies your lua files don&#39;t leak global variables
by accident.
<!--/#echo -->




Setup
-----

The recommended way to add this action to your repo is:

1.  Copy this repo's [`docs/example_workflow.yaml`](docs/example_workflow.yaml)
    into your repo as `.github/workflows/lua_contemn_stray_globals.yaml`
1.  Commit it to the default branch.
    (For determining CI config, GitHub always reads the master branch,
    independent of which branch is to be checked.)


Configuration
-------------

See [the `find_globals` docs][find_globals-docs] for how to ignore selected
variable names.

  [find_globals-docs]: https://mk-pmb.github.io/lua-util-pmb/find_globals.html




Help, I have too many intentional globals!
------------------------------------------

See the ["First aid" chapter of the `find_globals` docs][first-aid].

  [first-aid]: https://mk-pmb.github.io/lua-util-pmb/find_globals.html#first-aid




Known issues
------------

* Needs more/better tests and docs.







<!--#toc stop="scan" -->
&nbsp;


License
-------
<!--#echo json="package.json" key=".license" -->
ISC
<!--/#echo -->
