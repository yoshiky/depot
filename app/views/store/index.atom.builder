atom_feed({'xmlns:dc'=> 'http://purl.org/dc/elements/1.1/',
    'xmlns:dcterms'=> 'http:purl.org/dc/terms',
    'xmlns:opds'=>'http://opds-spec.org/2010/catalog'
}) do |feed|
  feed.title "All Books！！"
  feed.updated Time.now

  @products.each do |product|
    feed.entry(product,
      :url    => product.image_url) do |entry|
      entry.title(product.title)
      entry.content("#{product.price}円", :type => 'text')
    end
  end

end