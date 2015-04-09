This container is meant to run an emacs version configured for GoLang development.

It downloads the binaries (1.4.2) and sets up all the required directory structure and environment variables as described in [1] in ubuntu14.04.

This is based on the go dev container at [2] and the configuration of emacs for go development at [3], thank you guys!

It includes godep, gocode, goimports, golint, godef and goconvey. If your go source files reside at `/path/to/go/src` then you can spin up the container with:

    docker run -v /path/to/go/src:/workspace/src/github.com/myuser/myproject -i -t fgimenez/emacs-n-go /usr/bin/emacs

You can also use the `emacs-n-go.sh` script, which spins a goconvey server in `http://127.0.0.1:8080` and executes automatically tests in your working directory (it may require sudo credentials for the docker command):

    ./emacs-n-go.sh /path/to/go/src github.com/myuser/myproject

Happy coding!

[1] http://golang.org/doc/code.html

[2] https://registry.hub.docker.com/u/tmrudick/go/

[3] http://tleyden.github.io/blog/2014/05/22/configure-emacs-as-a-go-editor-from-scratch/
