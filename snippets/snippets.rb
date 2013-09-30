with_defaults :scope => 'source.php' do

  snippet 'singleton' do |s|
  	s.trigger = 'singleton'
  	s.expansion = "/**
 * The singleton instance of ${1:class}
 *
 * @var ${1:class}
 */
protected static \\$_singleton;
 
/**
 * Returns the singleton instance of ${1:class}
 *
 * @return ${1:class}
 */
static public function singleton() {
	if(!self::\\$_singleton instanceof ${1:class})
	    self::\\$_singleton = new ${1:class};
 
	return self::\\$_singleton;
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
	self::\\$_singleton = null;
}"
  end
  
end