xml.instruct! :xml, :version => "1.0", :encoding => "UTF-8"
xml.feed('xmlns:atom' => 'http://www.w3.org/2005/Atom',
    'xmlns:dc'=> 'http://purl.org/dc/elements/1.1/',
    'xmlns:dcterms'=> 'http:purl.org/dc/terms',
    'xmlns:opds'=>'http://opds-spec.org/2010/catalog') do
    xml.title 'Seikyo eBooks'
    xml.link(:type => 'application/atom+xml;profile=opds-catalog;kind=navigation',
             :rel => 'self',
             :href => 'http://localhost:3000/store/index.opds')
    xml.link(:type => 'application/atom+xml;profile=opds-catalog;kind=navigation',
             :rel => 'start',
             :href => 'http://localhost:3000/store/index.opds')
    xml.language "en-US"
    xml.pubDate(Time.now.strftime("%a, %d %b %Y %H:%M:%S %Z"))
    @products.each do |product|
      xml.entry do
        xml.title(product.title)
        xml.link('http://google.com')
        xml.price(product.price)
      end
    end
end