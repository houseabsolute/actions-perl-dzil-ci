# What Is This?

This is a reusable workflow for GitHub Actions. It is _not_ a GitHub Action. The difference is that
a reusable workflow, like this one, defines a set of jobs. An Action defines a set of steps.

## What Does It Do?

This workflow is designed to help me test my Perl projects, all of which use
[`Dist::Zilla`](https://dzil.org/). It does the following things:

- Builds a release tarball using `dzil`.
- Downloads that tarball and runs all of the tests including author, dev, etc.
- Downloads that tarball and runs the normal tests on a variety of platforms and Perls.

## Can I Use This Too?

Yes? It's not really designed to be super flexible and reusable, but maybe it will work for your
needs.

Before you report any issues, here are some things I _don't_ want to do with this workflow:

- Support Perl distros that don't use `dzil`.
- Support Perl versions that aren't provided by
  [`shogo82148/actions-setup-perl`](https://github.com/shogo82148/actions-setup-perl).
- Do a lot of work on this to support a bizarre use case.

With that said, do feel free to report issues. If it's not something I want to support, that's ok. I
will politely close the issue.
