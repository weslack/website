# Website

The static site behind [weslack.team](https://weslack.team) — a single page with the logo.

The CTF notes and write-ups that used to live here have moved to our Outline wiki at
<https://outline.weslack.team> (collections `DC28`, `IoT Village CTF 2021`, `DC29`, and
`weslack`). The original Hugo source remains in this repository's git history.

## Layout

Everything published lives in `site/`:

```
site/
├── index.html    the page
├── logo.png      the logo
├── favicon.ico
├── CNAME         weslack.team
└── LICENSE.txt
```

## Developing

No build step, no dependencies. Preview it locally with:

```sh
python3 -m http.server -d site
```

then open <http://localhost:8000>.

## Deploying

Pushing to `master` runs `.github/workflows/pages.yml`, which publishes `site/`
to `weslack/weslack.github.io`.
