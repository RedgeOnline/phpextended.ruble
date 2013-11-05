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
  
  snippet 'Array member' do |s|
    s.trigger = 'array_member'
    s.expansion = "/**
 * @since   ${1:since}
 * @var     array:${2:type}
 */
private \\$_${3:name};
/**
 * @since   ${1:since}
 * @param   \\$${3:name}  array:${2:type}
 * @return  ${4:class}    Chainable
 */
public function set${5:name_cap}( array \\$${3:name} ) {
    \\$this->_${3:name} = \\$${3:name};
    return \\$this;
}
/**
 * @since   ${1:since}
 * @param   \\$${3:name}  ${2:type}
 * @return  ${4:class}      Chainable
 */
public function add${5:name_cap}${0:cursor}( \\$${3:name} ) {
    \\$this->_${3:name}[] = \\$${3:name};
    return \\$this;
}
/**
 * @since   ${1:since}
 * @return  array:${2:type}
 */
public function get${5:name_cap}() {
    return \\$this->_${3:name};
}"
  end
  
  snippet 'Getter/Setter' do |s|
    s.trigger = 'getter-setter'
    s.expansion = "/**
 * @since ${1:since} 
 * @var   ${2:type}
 */
protected \\$${3:name};
  
/**
 * @since   ${1:since} 
 * @param   \\$${3:name}  ${2:type}
 * @return  ${4:class}  Chainable
 */
public function set${5:name_cap}(\\$${3:name}) {
    \\$this->${3:name} = (${2:type}) \\$${3:name};
    return \\$this;
}
 
/**
 * @since   ${1:since}
 * @return  ${2:type}
 */
public function get${5:name_cap}() {
    return \\$this->${3:name};
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