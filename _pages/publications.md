---
layout: page
permalink: /publications/
title: Publications
description: ""
nav: true
nav_order: 2
---

<!-- _pages/publications.md -->

<!-- Bibsearch Feature -->

<!-- {% include bib_search.liquid %} -->

<div class="publications">

{% include pub_filter.liquid types="Preprint,Peer-reviewed,PhD Thesis" %}

{% bibliography --file papers %}

</div>
