# Website

The static site behind [weslack.team](https://weslack.team). No build step, no
dependencies — plain HTML and CSS deployed straight to GitHub Pages.

The CTF notes and write-ups that used to live here have moved to our Outline
wiki at <https://outline.weslack.team> (collections `DC28`,
`IoT Village CTF 2021`, `DC29`, and `weslack`). The original Hugo source
remains in this repository's git history.

## Layout

```
site/               published — everything here goes live
├── index.html      the landing page (self-contained, just the logo)
├── style.css       shared styling for content pages
├── logo.png
├── favicon.ico
├── CNAME
└── LICENSE.txt

drafts/             NOT published — staging area, see drafts/README.md
└── _template.html
```

## Previewing

```sh
./preview.sh            # the live site
./preview.sh --drafts   # live site plus drafts/
```

## Adding a page

Write it in `drafts/` first, where it is versioned and reviewable but not
public:

```sh
cp drafts/_template.html drafts/notes.html
./preview.sh --drafts
```

When it is ready, `git mv drafts/notes.html site/notes.html`, remove the
`noindex` meta tag, and push. See [drafts/README.md](drafts/README.md).

## Deploying

Pushing to `master` runs `.github/workflows/pages.yml`, which uploads `site/`
and deploys it to GitHub Pages, served at [weslack.team](https://weslack.team).

There is no separate publishing repository. The site used to be built by Hugo
and pushed to `weslack/weslack.github.io` with a deploy key; that repository is
retired and the custom domain now points at this one.
