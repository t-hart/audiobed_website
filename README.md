Audiobed website project
========================

The goal of this project is to create a simple static website for the purposes of learning and gaining experience with Rust (server), Elm (front-end), and, to a lesser degree, CSS (in particular: CSS grid).

Furthermore, in the interest of gaining more experience with deployment and integration systems, the project will use Travis CI for integration testing and deployment to Heroku.

Roadmap
-------

### <span class="done DONE">DONE</span> Create repo

CLOSED: \[2018-04-22 Sun 20:44\]

-   \[X\] Git init
-   \[X\] Add readme
-   \[X\] Add .gitignore
-   \[X\] Configure commit hooks
-   \[X\] Set up remote
-   \[X\] Invite collaborators

### <span class="todo TODO">TODO</span> Git commit hooks? \[1/2\] \[50%\]

-   \[X\] Automatic md export of \`README.org\` to \`README.md\`
-   \[ \] Formatting source code \[0/5\] \[0%\]
    -   \[ \] CSS
    -   \[ \] Elm
    -   \[ \] HTML?
    -   \[ \] JS (Standard)
    -   \[ \] Rust

### <span class="todo TODO">TODO</span> Set up Travis build process \[0/3\] \[0%\]

-   \[ \] Set up automatic compilation of Elm to html
-   \[ \] Set up file renaming on push \[0/2\] \[0%\]
    -   \[ \] Write script to do this
    -   \[ \] test said script
    -   To avoid caching issues, every time a JS, CSS, HTML file is updated, its name should change. This way, a browser will never request a stale version of a certain file.
    -   Suggestion: each file should have appended to the name the commit hash for the last change to the file (e.g. \`main-8fe642ed.html\`)
    -   Alternatively, if the above gets too difficult, it's also possible to use the hash of the commit that triggered the publish
    -   Solution: make the build system rename relevant files in place and change all references to the files before building
-   \[ \] Set up testing

### <span class="todo TODO">TODO</span> Set up Heroku integration \[0/2\] \[0%\]

-   \[ \] Set up automatic publish on push to master
-   \[ \] Set up multiple versions of the site for multiple branches \[0/3\] \[0%\]
    -   \[ \] master
    -   \[ \] dev
    -   \[ \] create an easy system to add new branches
        -   This can either be a simple set of instructions, an automatic process, **or** a script that takes care of it

