This container is meant to run an emacs version configured for GoLang development.

It downloads the binaries (1.4.2) and sets up all the required directory structure and environment variables as described in [1] in ubuntu14.04.

This is based on the go dev container at [2] and the configuration of emacs for go development at [3], thank you guys!

If your go source files reside at `/path/to/go/src` then You can spin up the container with:

    docker run -v /path/to/go/src:/workspace/src -i -t fgimenez/emacs-n-go

Happy coding!

[1] http://golang.org/doc/code.html

[2] https://registry.hub.docker.com/u/tmrudick/go/

[3] http://tleyden.github.io/blog/2014/05/22/configure-emacs-as-a-go-editor-from-scratch/
