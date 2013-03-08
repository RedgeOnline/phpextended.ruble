require 'ruble'

command 'dump' do |cmd|
  cmd.key_binding = 'ALT+SHIFT+D'
  cmd.scope = 'source.php'
  cmd.output = :insert_as_snippet
  cmd.input = :selection, :line
  cmd.invoke do |context|
    input = STDIN.read.strip.gsub(/\$/,'\\$')
    input = input[0..-2] if ( input[-1] == 59 ) # laatste ; weghalen
    template = "die(var_dump( VAR ));"
    input.empty? ? template.gsub(/VAR/, '$0') : template.gsub(/VAR/, input)
  end
end
