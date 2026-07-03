require "bibtex"

Jekyll::Hooks.register :site, :pre_render do |site|
  bib_dir = File.join(site.source, site.config.dig("scholar", "source") || "_bibliography")
  categories = {}

  Dir.glob(File.join(bib_dir, "*.bib")).each do |bib_path|
    key = File.basename(bib_path, ".bib")
    begin
      bibliography = BibTeX.open(bib_path)
      abbrs = bibliography.map { |entry| entry[:abbr].to_s if entry[:abbr] }.compact.uniq.sort
      categories[key] = abbrs
    rescue => e
      Jekyll.logger.warn "bib_categories:", "Could not parse #{bib_path}: #{e.message}"
    end
  end

  site.data["bib_categories"] = categories
end