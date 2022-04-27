---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: resume
lang: fr
href: index
---

{% for section in site.sections %}
  <h1>{{ section.section }}</h1>
  <div>{{ section.content }}</div>
{% endfor %}