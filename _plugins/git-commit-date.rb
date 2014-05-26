# Jekyll plugin for UTC commit date
#
# Put this file into your `_plugins` directory as `git-commit-date.rb`
#
# Use by putting YAML frontmatter in your (say) HTML files and using Liquid
# Template syntax in the file, eg:
#
# ---
# layout: default
# title: A webpage
# ---
#
# <html>
# <head>
# </head>
# <body>
# Here is a date: {{ site.data['commit_date'] }}.
# </body>
# </html>

module Jekyll
  class GitCommitDateGenerator < Generator
    priority :high
    safe true
    def generate(site)
      cdate = %x( TZ=UTC git log -1 --date=local --format=%cd ).strip
      site.data['commit_date'] = cdate
    end
  end
end
