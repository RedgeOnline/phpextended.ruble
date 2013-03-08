require 'ruble'

command 'Filter array' do |cmd|
  cmd.key_binding = 'ALT+SHIFT+F'
  cmd.scope = 'source.php'
  cmd.output = :insert_as_snippet
  cmd.input = :selection, :line
  cmd.invoke do |context|
    input = STDIN.read.strip.gsub(/\$/,'\\$')
    input = input[0..-2] if ( input[-1] == 59 ) # laatste ; weghalen
    template = "array_filter( VAR, function(\\$item) { return \\$item instanceof $0; } )"
    input.empty? ? template.gsub(/VAR/, '${1:array}') : template.gsub(/VAR/, input)
  end
end
