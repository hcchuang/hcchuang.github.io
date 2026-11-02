# hcchuang.github.io

Source for my personal academic website, https://hcchuang.github.io/.

The site is a single page built with Jekyll (based on the Academic Pages theme):

- `_pages/about.md` — the home page (bio, working papers, publications)
- `_config.yml` — site title, sidebar profile and links
- `files/` — CV, papers and slides linked from the home page
- `images/` — profile photo and site icons
- `_layouts/`, `_includes/`, `_sass/`, `assets/` — theme files

Pushing to `master` rebuilds and deploys the site via `.github/workflows/jekyll.yml`.

To preview locally (needs Ruby and Bundler):

```bash
bundle install
bundle exec jekyll serve
```
