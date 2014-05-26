# Jekyll plugin for git describe output
#
# Put this file into your `_plugins` directory as `git-describe.rb`
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
# Here is the output of git describe: {{ site.data['describe'] }}.
# </body>
# </html>

module Jekyll
  class GitDescribeGenerator < Generator
    priority :high
    safe true
    def generate(site)
      description = %x( git describe ).strip
      site.data['describe'] = description
    end
  end
end
