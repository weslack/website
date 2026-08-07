# Drafts

Pages in here are **not deployed**. The Pages workflow only uploads `site/`, so
anything in this directory lives in the repository — reviewable in a pull
request — without appearing on [weslack.team](https://weslack.team).

## Writing one

```sh
cp drafts/_template.html drafts/notes.html
./preview.sh --drafts          # http://localhost:8000/notes.html
```

Use root-relative paths (`/style.css`, `/logo.png`) so the links keep working
unchanged once the page is published.

## Publishing one

Move it into `site/` and push:

```sh
git mv drafts/notes.html site/notes.html
```

Then drop the `<meta name="robots" content="noindex">` line from the file, so
it can be indexed. Pushing to `master` deploys it.

Nothing links to a new page automatically — the landing page is just the logo.
Add a link where you want it to be reachable.
