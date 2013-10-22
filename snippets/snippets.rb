with_defaults :scope => 'source.php' do

  snippet 'singleton' do |s|
  	s.trigger = 'singleton'
  	s.expansion = "/**
 * The singleton instance of ${1:class}
 *
 * @var ${1:class}
 */
protected static \\$_instance;

/**
 * Returns the singleton instance of ${1:class}
 *
 * @return ${1:class}
 */
static public function instance() {
	if(!self::\\$_instance instanceof ${1:class})
	    self::\\$_instance = new ${1:class};

	return self::\\$_instance;
}

/**
 * Standard constructor (protected: singleton)
 */
protected function __construct(){}

/**
 * Destroys the current ${1:class} instance
 *
 * (In fact this simple overwrites the current singleton instance)
 */
static public function destroy() {
	self::\\$_instance = null;
}"
  end

  snippet 'Array Map' do |s|
    s.trigger = 'map'
    s.expansion = "array_filter(array_map(function(\\$item) {
    return ${0:cursor};
  },
  ${1:array}
));"
  end

end