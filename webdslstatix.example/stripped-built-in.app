built-in

// overridable attributes for generator built-in templates and library input templates

attributes navigate{  }
attributes downloadlink{  }
attributes outputimage{  }
attributes submit{  }
attributes submitlink{ }
attributes form{ }
attributes navigatebutton{ }
attributes captcha{ }
attributes image{ }

attributes inputInt{  }
attributes inputBool{  }
attributes inputString{  }
attributes inputEmail{  }
attributes inputSecret{  }
attributes inputURL{  }
attributes inputText{  }
attributes inputWikiText{  }
attributes inputFloat{  }
attributes inputLong{  }
attributes inputDate{  }
attributes inputSetCheckbox{  }
attributes inputSetCheckboxElements{  }
attributes inputSelect{  }
attributes inputSelectMultiple{  }
attributes inputFile{  }
attributes inputMultiFile{  }
attributes inputSDF{  }
attributes radio{  }

// page request statistics

native class utils.Statistics as RequestStatistics{
  static logStatistics()
}

function logStatistics(){

}

invoke logStatistics() every 5 minutes

// hibbernate transaction management

native class utils.IncludePaths as IncludePaths{
  static jQueryJS(): String
  static jQueryUIJS(): String
  static jQueryUITouchPunchJS(): String
  static jQueryUICSS(): String
  static momentJS() : String
  static timepickerJS(): String
  static timepickerCSS(): String
}

native class utils.ValidationException as NativeValidationException{
  getName(): String
  getErrorMessage(): String
  isRelevantObject( Object ): Bool
}

native class utils.HibernateTransactionHelper as HibernateTransactionHelper{
  static commitAndStartNewTransaction(): [NativeValidationException]
  static rollbackAndStartNewTransaction()
}

function commitAndStartNewTransaction(): [NativeValidationException]{

}

function rollbackAndStartNewTransaction(){

}

// session management

invoke internalCleanupSessionManagerEntities() every 10 minutes

function internalUpdateSessionManagerTimeout() : Bool{

}

function internalCleanupSessionManagerEntities(){

}

// limit attempts
native class org.webdsl.security.AttemptsTracker as AttemptsTracker{
  static attempt(String, String, Int) : Bool
  static reset(String, String)
}

function mayAttempt( type: String ) : Bool{

}
function mayAttempt( type: String, actorId: String ) : Bool{

}
function mayAttempt( type: String, actorId: String, tenMinAttemptLim: Int ) : Bool{

}

function renewFacetIndexReaders(){

}

function optimizeSearchIndex(){

}

function updateSuggestionIndex(){

}

native class webdsl.generated.search.IndexManager as IndexManager{
  static indexSuggestions()
  static indexSuggestions( [String] )
  static optimizeIndex()
  static renewFacetIndexReaders()
  static clearAutoCompleteIndex( String )
  static clearSpellCheckIndex( String )
  static reindex( Entity )
  static reindex( List<Entity> )
  static removeFromIndex( Entity )
  static reindex()
}

native class org.webdsl.search.SearchHelper as SearchHelper{
   static firstIndexLink( Int, Int, Int ): Int
   static lastIndexLink( Int, Int, Int ): Int
}

native class org.webdsl.search.DynamicSearchField as DynamicSearchField{
   constructor( String, String )
}

native class org.webdsl.search.WebDSLFacet as Facet{
  constructor()
  static fromString( String ): Facet
  asString(): String
  isSelected(): Bool
  getCount(): Int
  getValue(): String
  getFieldName(): String
  getValueAsDate(): Date
  getValueAsFloat(): Float
  getValueAsInt(): Int
  must(): Facet
  mustNot(): Facet
  should(): Facet
  isMust(): Bool
  isMustNot(): Bool
  isShould(): Bool
}

function escapeQuery( q: String ): String{

}

native class org.webdsl.search.AbstractEntitySearcher as Searcher{
  static escapeQuery( String ): String
  static fromString( String ): Searcher
  asString(): String
  enableFaceting( String, Int ): Searcher
  enableFaceting( String, String ): Searcher
  getFacets( String ): [Facet]
  addFacetSelection( Facet ): Searcher
  addFacetSelection( [Facet] ): Searcher
  getFacetSelection(): [Facet]
  getFacetSelection( String ): [Facet]
  removeFacetSelection( Facet ): Searcher
  clearFacetSelection(): Searcher
  clearFacetSelection( String ): Searcher
  highlight( String, String ):  String
  highlight( String, String, String, String, Int, Int, String ): String
  highlight( String, String, String, String ): String
  highlightLargeText( String, String ):  String
  highlightLargeText( String, String, String, String, Int, Int, String ): String
  highlightLargeText( String, String, String, String ): String
  highlightHTML( String, String ):  String
  highlightHTML( String, String, String, String, Int, Int, String ): String
  highlightHTML( String, String, String, String ): String
  highlightLargeHTML( String, String ):  String
  highlightLargeHTML( String, String, String, String, Int, Int, String ): String
  highlightLargeHTML( String, String, String, String ): String
  getQuery(): String
  luceneQuery(): String
  searchTime(): String
  searchTimeMillis(): Int
  searchTimeSeconds(): Float
  allowLuceneSyntax( Bool ): Searcher
  addFieldFilter( String, Object ): Searcher
  addFieldFilter( String, String ): Searcher
  getFilteredFields(): [String]
  getFieldFilterValue( String ): String
  removeFieldFilter( String ): Searcher
  clearFieldFilters(): Searcher
  startMustClause(): Searcher
  startMustNotClause(): Searcher
  startShouldClause(): Searcher
  results(): [Entity]
  must(): Searcher
  should(): Searcher
  not(): Searcher
  endClause(): Searcher
  setNamespace( String ): Searcher
  setNamespace( Object ): Searcher
  getNamespace(): String
  removeNamespace(): Searcher
  boost( String, Float ): Searcher
  strictMatching( Bool ): Searcher
  field( String ): Searcher
  fields( [String] ): Searcher
  defaultFields(): Searcher
  getFields(): [String]
  setOffset( Int ): Searcher
  getOffset(): Int
  setLimit( Int ): Searcher
  getLimit(): Int
  scores(): [Float]
  explanations(): [String]
  count(): Int
  moreLikeThis( String ): Searcher
  sortDesc( String ): Searcher
  sortAsc( String ): Searcher
  clearSorting(): Searcher
  reset(): Searcher
  query( Object ): Searcher
  query( String ): Searcher
  phraseQuery( String, Int ): Searcher
  phraseQuery( Object, Int ): Searcher
  regexQuery( String ): Searcher
  rangeQuery( Int, Int, Bool, Bool ): Searcher
  rangeQuery( Float, Float, Bool, Bool ): Searcher
  rangeQuery( Date, Date, Bool, Bool ): Searcher
  rangeQuery( String, String, Bool, Bool ): Searcher
  rangeQuery( Int, Int ): Searcher
  rangeQuery( Float, Float ): Searcher
  rangeQuery( Date, Date ): Searcher
  rangeQuery( String, String ): Searcher
  matchAllQuery(): Searcher
}

native class org.webdsl.search.SearchStatistics as SearchStatistics{
  static clear(): Void
  static getSearchQueryExecutionCount(): Long
  static getSearchQueryTotalTime(): Long
  static getSearchQueryExecutionMaxTime(): Long
  static getSearchQueryExecutionAvgTime(): Long
  static getSearchQueryExecutionMaxTimeQueryString(): String
  static getObjectLoadingTotalTime(): Long
  static getObjectLoadingExecutionMaxTime(): Long
  static getObjectLoadingExecutionAvgTime(): Long
  static getObjectsLoadedCount(): Long
  static isStatisticsEnabled(): Bool
  static setStatisticsEnabled( Bool ): Bool
  static getSearchVersion(): String
  static getIndexedClassNames(): [String]
  static indexedEntitiesCount(): [String]
}

//The default analyzer, equal to the one used by default in hibernate search
default_builtin_analyzer analyzer hsearchstandardanalyzer{
  tokenizer = StandardTokenizer
  token filter = StandardFilter
  token filter = LowerCaseFilter
  token filter = StopFilter
}

//Template showing the info available through Hibernate Search statistics
template showSearchStats(){

}

//Tries to highlight the elements inside, not touching the html tags inside (highlighter invoked to ignore html tags)
//If nothing is highlighted, it just renders elements
//Hits are surrounded by tags <span class = "highlightcontent">HIT</span>
template highlight( s: Searcher, fld: String ){

}

//Outputs a summary surrogate for the given text 'txt' based on constraints in searcher 's' for search field 'fld'
//A summary suggorate will consist of at most 3 fragments of max 80 characters seperated by '... '
//Hits are surrounded by tags <span class = "highlightcontent">HIT</span>
template highlightedSummary( s: Searcher, fld: String, txt: String ){

}

//Outputs a summary surrogate for the given text 'txt' based on constraints in searcher 's' for search field 'fld'
//A summary suggorate will consist of at most 3 fragments of max 80 characters seperated by '... '
//Hits are surrounded by tags <span class = "highlightcontent">HIT</span>
template highlightedSummary( s: Searcher, fld: String, txt: WikiText ){

}


// section methods for built-in types

type String{ //includes other String-based types such as Secret, Patch, Email, URL, etc.
  length(): Int
  toLowerCase(): String
  toUpperCase(): String
  replace( String, String ): String
  startsWith( String ): Bool
  startsWith( String, Int ): Bool
  endsWith( String ): Bool
  trim(): String
  utils.StringType.parseUUID                   as parseUUID(): UUID
  org.webdsl.tools.Utils.containsDigit         as containsDigit(): Bool
  org.webdsl.tools.Utils.containsLowerCase     as containsLowerCase(): Bool
  org.webdsl.tools.Utils.containsUpperCase     as containsUpperCase(): Bool
  org.webdsl.tools.Utils.isCleanUrl            as isCleanUrl(): Bool
  org.apache.commons.lang3.StringUtils.contains as contains( String ): Bool // this 'contains' function handles null, null as either arg will produce false
  utils.StringType.parseInt                    as parseInt(): Int
  utils.StringType.split                       as split(): [String]
  utils.StringType.splitWithSeparator          as split( String ): [String] //TODO Regex as argument
  utils.StringType.parseLong                   as parseLong(): Long
  utils.StringType.parseFloat                  as parseFloat(): Float
  utils.DateType.parseDate as parseDate( String ): Date
  utils.DateType.parseDate as parseDateTime( String ): DateTime
  utils.DateType.parseDate as parseTime( String ): Time
  org.apache.commons.lang3.StringEscapeUtils.escapeEcmaScript as escapeJavaScript(): String
  substring( Int ): String
  substring( Int, Int ): String
  utils.StringType.similarity as similarity(String) : Float
  utils.StringType.isNullOrEmpty				as isNullOrEmpty(): Bool
  utils.StringType.valueOrDefault				as valueOrDefault(String): Bool
  utils.StringType.valueNonEmptyOrDefault   	as valueNonEmptyOrDefault(String): Bool
}

type Secret{
  org.webdsl.tools.Utils.secretDigest  as digest(): Secret
  org.webdsl.tools.Utils.secretCheck   as check(Secret): Bool
}

type Patch{
  name.fraser.neil.plaintext.patch_factory.patchApply  as applyPatch( String ): String
  name.fraser.neil.plaintext.patch_factory.unpatchApply  as revertPatch( String ): String
  name.fraser.neil.plaintext.patch_factory.diffHTML  as diffHTML( Bool ): String
}
type String{
  name.fraser.neil.plaintext.patch_factory.patchMake   as makePatch( String ): Patch
  name.fraser.neil.plaintext.patch_factory.diff        as diff( String ): [String]
}

type Long{
  intValue(): Int
}

type DateTime{ // includes Date and Time types
  utils.DateType.format as format( String ): String
  before( DateTime ): Bool
  after( DateTime ): Bool
  getTime(): Long
  setTime( Long )
  utils.DateType.addYears as addYears( Int ): DateTime
  utils.DateType.addMonths as addMonths( Int ): DateTime
  utils.DateType.addDays as addDays( Int ): DateTime
  utils.DateType.addHours as addHours( Int ): DateTime
  utils.DateType.addMinutes as addMinutes( Int ): DateTime
  utils.DateType.addSeconds as addSeconds( Int ): DateTime
  utils.DateType.getYear as getYear(): Int
  utils.DateType.getMonth as getMonth(): Int
  utils.DateType.getDay as getDay(): Int
  utils.DateType.getDayOfYear as getDayOfYear(): Int
  utils.DateType.getHour as getHour(): Int
  utils.DateType.getMinute as getMinute(): Int
  utils.DateType.getSecond as getSecond(): Int
}

function age( d: Date ): Int{
  var today: Date := today();
  var age := today.getYear() - d.getYear();
  if( today.getDayOfYear() < d.getDayOfYear() ){
    age := age - 1;
  }
  return age;
}

native class utils.DateType as DateType{ //@TODO static functions not yet supported in type import of DateTime above
  static getDefaultDateFormat(): String
  static getDefaultTimeFormat(): String
  static getDefaultDateTimeFormat(): String
}

type WikiText{
  org.webdsl.tools.WikiFormatter.wikiFormat as format(): String
  org.webdsl.tools.WikiFormatter.wikiFormatNoTagFiltering as formatNoTagFiltering(): String
}

type Email{
  utils.EmailType.isValid as isValid(): Bool
}

type URL{
  utils.URLType.isValid as isValid(): Bool
  utils.URLType.download as download(): File
}

type File{
  getContentAsString(): String
  getContentType(): String
  setContentType( String )
  getFileName(): String
  getSizeInBytes() : Long
  getSizeHumanReadable() : String  
  delete() : File
}
type String{
  utils.File.createFromString as asFile( String ): File
  utils.File.createFromFilePath as pathToFile() : File
}
type Image{
  getContentAsString(): String
  getContentType(): String
  setContentType( String )
  getFileName(): String
  delete() : File
}

// access to servlet context

native class utils.AbstractDispatchServletHelper as DispatchServlet{
  getIncomingSuccessMessages(): [String]
  getOutgoingSuccessMessages(): [String]
  clearSuccessMessages()
  getRequest(): HttpServletRequest
  getRequestURL() : String
  getRemoteAddress() : String
  static get(): DispatchServlet
  getBaseUrl(): String
  getUrlComponents(): [String]
  renewCookieValue()
}
function getDispatchServlet(): DispatchServlet{

}

native class javax.servlet.http.HttpServletRequest as HttpServletRequest{
  getRemoteAddr(): String
  getAttribute( String ): Object
}

function getServerAttribute( name: String ): String {

}
function remoteAddress(): String{

}
function baseUrl(): String{

}
function urlComponents(): [String]{

}

// access to page context

native class utils.AbstractPageServlet as PageServlet{
  inSubmittedForm(): Bool
  formRequiresMultipartEnc: Bool
  getFileUploads( String ): [File]
  getLabelString(): String
  inLabelContext(): Bool
  addValidationException( String, String )
  getValidationErrorsByName( String ): [String]
  static getRequestedPage(): PageServlet
  enterLabelContext( String )
  leaveLabelContext()
  setTemplateContext( TemplateContext )
  getTemplateContext(): TemplateContext
  setMimetype( String )
  isRedirected(): Bool
  getRedirectUrl(): String
  setRedirectUrl( String )
  enableDownloadInline()
  addReRenderPlaceholders( String )
  addBodyAttribute( String, String )
  submitWrapOpenHelper( String )
  submitWrapCloseHelper()
  actionHasAjaxPageUpdates: Bool
  getXForwardedProto(): String
  getXForwardedFor(): String
  reloadSessionManagerFromExistingSessionId( UUID )
  addResponseHeader( String, String )
}
function getPage(): PageServlet{

}
function replace( ph: String ){

}

native class utils.TemplateContext as TemplateContext{
  clone(): TemplateContext
  getTemplateContextString(): String
}

function mimetype( s: String ){

}
template mimetype( s: String ){

}

function downloadInline(){

}
template downloadInline(){

}

function addBodyAttribute( key: String, value: String ){

}
template addBodyAttribute( key: String, value: String ){

}

//access to template context

native class utils.TemplateServlet as TemplateServlet{
  getUniqueId(): String
  getUniqueIdNoCache(): String
  static getCurrentTemplate(): TemplateServlet
}
function getTemplate(): TemplateServlet{

}

// utitity for templates that handle validation

function handleValidationErrors( errors: [String] ): [String]{

}

// section XML
native class org.w3c.dom.Document as XMLDocument : XMLNode{
  org.webdsl.xml.XMLUtil.getElementsByTagName as getElementsByTagName(String) : List<XMLNode>
  org.webdsl.xml.XMLUtil.getElementsByXPath as getElementsByXPath(String) : List<XMLNode>
  org.webdsl.xml.XMLUtil.getNodesByXPath as getNodesByXPath(String) : List<XMLNode>
  org.webdsl.xml.XMLUtil.asString as asString() : String
}

native class org.w3c.dom.Node as XMLNode{
  org.webdsl.xml.XMLUtil.getElementsByTagName as getElementsByTagName(String) : List<XMLNode>
  org.webdsl.xml.XMLUtil.getElementsByXPath as getElementsByXPath(String) : List<XMLNode>
  javaxt.xml.DOM.getNodeValue as getVal() : String
  org.webdsl.xml.XMLUtil.getText as getVal(String) : String
  javaxt.xml.DOM.getAttributeValue as getAttrVal(String) : String
  org.webdsl.xml.XMLUtil.getChildren as getChildren() : List<XMLNode>
  org.webdsl.xml.XMLUtil.getAttributes as getAttributes() : List<XMLNode>
  getNodeName() : String 
  org.webdsl.xml.XMLUtil.setValue as setValue(String)
}

type String{
	javaxt.xml.DOM.createDocument as asXMLDocument() : XMLDocument
}

//  section JSON for services

native class com.google.gson.JsonObject as JSONObject {
  constructor()
  utils.JSONType.parseJsonObject as constructor( String )
  utils.JSONType.getString as getString( String ): String
  utils.JSONType.getBoolean as getBoolean( String ): Bool
  utils.JSONType.getInt as getInt( String ): Int
  utils.JSONType.getLong as getLong( String ): Long
  utils.JSONType.getDouble as getDouble( String ): Double
  utils.JSONType.getJSONObject as getJSONObject( String ): JSONObject
  utils.JSONType.getJSONArray as getJSONArray( String ): JSONArray
  utils.JSONType.getJSONNull as getNullValue( String ): JSONNull
  has( String ): Bool
  utils.JSONType.put as put( String, String )
  utils.JSONType.put as put( String, Bool )
  utils.JSONType.put as put( String, Int )
  utils.JSONType.put as put( String, Long )
  utils.JSONType.put as put( String, Float )
  utils.JSONType.put as put( String, Double )
  utils.JSONType.put as put( String, JSONObject )
  utils.JSONType.put as put( String, JSONArray )
  utils.JSONType.put as put( String, JSONNull )
  utils.JSONType.put as put( String, UUID )
  utils.JSONType.toString as toString(): String
  utils.JSONType.nullValue as static nullValue(): JSONNull
}

native class com.google.gson.JsonNull as JSONNull {}

native class com.google.gson.JsonArray as JSONArray {
  constructor()
  utils.JSONType.parseJsonArray as constructor( String )
  utils.JSONType.getString as getString( Int ): String
  utils.JSONType.getBoolean as getBoolean( Int ): Bool
  utils.JSONType.getInt as getInt( Int ): Int
  utils.JSONType.getLong as getLong( Int ): Long
  utils.JSONType.getDouble as getDouble( Int ): Double
  utils.JSONType.getJSONObject as getJSONObject( Int ): JSONObject
  utils.JSONType.getJSONArray as getJSONArray( Int ): JSONArray
  utils.JSONType.getJSONNull as getNullValue( Int ): JSONNull
  utils.JSONType.length as length(): Int
  utils.JSONType.put as put( String )
  utils.JSONType.put as put( Bool )
  utils.JSONType.put as put( Int )
  utils.JSONType.put as put( Long )
  utils.JSONType.put as put( Float )
  utils.JSONType.put as put( Double )
  utils.JSONType.put as put( JSONObject )
  utils.JSONType.put as put( JSONArray )
  utils.JSONType.put as put( JSONNull )
  utils.JSONType.put as put( UUID )
  utils.JSONType.toString as toString(): String
}



native class java.lang.Double as Double{
    constructor( Double )
    constructor( Float )
    constructor( String )
    floatValue(): Float
}

//  section WebDriver for testing

function sleep( i: Int ){

}
function createTempFile( s: String ): String{

}

function getFirefoxDriver(): FirefoxDriver{

}
function getHtmlUnitDriver(): HtmlUnitDriver{

}
function getDriver(): WebDriver{

}

native class utils.Test as UtilsTestClass{
  static sleep( Int )
  static getHtmlUnitDriver(): HtmlUnitDriver
  static getFirefoxDriver(): FirefoxDriver
  static closeDrivers()
  static createTempFile( String ): String
}


native class org.openqa.selenium.WebDriver as WebDriver{
  get( String )
  getTitle(): String
  getPageSource(): String
  findElement( SelectBy ): WebElement
  findElements( SelectBy ): [WebElement]
  close()
  utils.Test.runJavaScript as runJavaScript( String ): String
  utils.Test.getAlert as getAlert(): WebAlert
  utils.Test.getSubmit as getSubmit(): WebElement
  utils.Test.getSubmits as getSubmits(): [WebElement]
}

native class org.openqa.selenium.Alert as WebAlert{
  getText(): String
  dismiss()
  accept()
}

native class org.openqa.selenium.By as SelectBy{
  static className( String ): SelectBy
  static id( String ): SelectBy
  static linkText( String ): SelectBy
  static name( String ): SelectBy
  static partialLinkText( String ): SelectBy
  static tagName( String ): SelectBy
  static cssSelector( String ): SelectBy
  static xpath( String ): SelectBy
}

native class org.openqa.selenium.WebElement as WebElement{
  getText(): String
  utils.Test.getValue as getValue(): String //WebElement.getValue() is deprecated
  getElementName(): String
  getAttribute( String ): String
  isEnabled(): Bool
  sendKeys( String )
  submit()
  clear()
  getAttribute( String ): String
  isEnabled(): Bool
  isSelected(): Bool
  findElements( SelectBy ): [WebElement]
  //void sendKeys(java.lang.CharSequence... keysToSend)
  utils.Test.click as toggle()
  utils.Test.click as setSelected()
  utils.Test.clickAndWait as click()
}

native class org.openqa.selenium.htmlunit.HtmlUnitDriver as HtmlUnitDriver: WebDriver{
  constructor()
}

native class org.openqa.selenium.firefox.FirefoxDriver as FirefoxDriver: WebDriver{
  constructor()
  utils.Test.takeScreenshot as takeScreenshot()
}

native class org.openqa.selenium.support.ui.Select as Select{
  deselectAll() // Clear all selected entries.
  deselectByIndex( Int ) // Deselect the option at the given index.
  deselectByValue( String ) // Deselect all options that have a value matching the argument.
  deselectByVisibleText( String ) // Deselect all options that display text matching the argument.
  escapeQuotes( String ): String
  getAllSelectedOptions(): [WebElement]
  getFirstSelectedOption(): WebElement
  getOptions(): [WebElement]
  isMultiple(): Bool
  selectByIndex( Int ) // Select the option at the given index.
  selectByValue( String ) // Select all options that have a value matching the argument.
  selectByVisibleText( String ) // Select all options that display text matching the argument.
  constructor( WebElement )
}

//email

entity QueuedEmail{
  body: String (length=1000000) //Note: default length for string is currently 255
  to: String (length=1000000)
  cc: String (length=1000000)
  bcc: String (length=1000000)
  replyTo: String (length=1000000)
  from: String (length=1000000)
  subject: String (length=1000000)
  unsubscribeAddress: String (length=1000000)
  // scheduled: DateTime (default=now())
  lastTry: DateTime
}



function internalHandleEmailQueue(){

}

native class utils.ThreadLocalEmailContext as ThreadLocalEmailContext{
  static inEmailContext(): Bool
}

function inEmailContext(): Bool {

}
define email sendQueuedEmail( q: QueuedEmail ){

}


// logging

entity RequestLogEntry{
  name: String
  requestedURL: Text
  start: DateTime
  end: DateTime
  clientIP: String
  clientPort: Int
  method: String
  referer: Text
  userAgent: Text
}

//built-in templates

// convenient for desugaring in the compiler that replaces template elements with a single templatecall, see RenderTemplateFunctionCall desugaring
template internalElementsWrapper(){ }

// e.g. head{ <meta charset="utf-8"/> }
template head(){  }

htmlwrapper{
  h1 h1
  h2 h2
  h3 h3
  h4 h4
  h5 h5
  h6 h6
  div div
  span span
  table table
  row tr
  column td
  par p
  pre pre
  spacer hr
  list ul[ class = "block" ]
  listitem li[ class = "block" ]
  block div[ class = "block" ]
  container span[ class = "container" ]
  groupitem tr
  strong strong
  emph em
  code code
}

template br(){}

template break(){}

template block( s: String ){

}

template fieldset( s: String ){
}

template group( s: String ){

}

template group(){

}


/*
  menubar{
    menu
    {
      menuheader{ ... }
      menuitems{
        menuitem{ ... }
        menuitem{ ... }
      }
    }
  }
*/

template menubar(){

}

template menuspacer(){

}

template menu(){

}

template menuheader(){

}

template menuitems(){

}

template menuitem(){

}

//reflection of entities

native class org.webdsl.lang.ReflectionEntity as ReflectionEntity{
  getName(): String
  getProperties(): [ReflectionProperty]
  getPropertyByName( String ): ReflectionProperty
  hasViewPage(): Bool
  static byName( String ): ReflectionEntity
  static all(): [ReflectionEntity]
}

native class org.webdsl.lang.ReflectionProperty as ReflectionProperty{
  getName(): String
  hasNotNullAnnotation(): Bool
  getFormatAnnotation(): String
}

//validation wrapper for submit and submitlink

template wrapsubmit( tname: String ) requires s( String ){

}

//reused when elements are empty

template elementsempty(){}

// Date/DateTime/Time input and output templates

template output( d: ref DateTime ){

}

template output(d: ref Time){

}

template output( d: ref Date ){

}

template dateoutputgeneric( d: ref Date, defaultformat: String ){

}

function convertJavaDateFormatToFlatPickr( f: String ): String{

}

function javaToJsDate(d : Date) : String{

}

function convertJavaDateFormatToMomentJS( f: String ): String{

}

template input( d: ref DateTime ){

}
 
template input( d: ref Date, minDate: DateTime, maxDate: DateTime ){

}

template input( d: ref DateTime, minDate: DateTime, maxDate: DateTime ){

}

template input( d: ref Time ){

}
template input( d: ref Date ){

}
template input( d: ref Date, minYear: Int, maxYear: Int ){

}

template dateinputgeneric( d: ref Date, visibleJavaDateFormat: String, options: String ){

}
template datepickerIncludes(){

}

function DATEPICKER_DATEFORMAT() : String    {  }
function DATEPICKER_TIMEFORMAT() : String    {  }
function DATEPICKER_DATETIMEFORMAT() : String{  }

template datepickerinput( d: ref Date, internalJavaDateFormat : String, visibleJavaDateFormat: String, tname: String, options: String ){

}

//output( Set )
/*
template output( set: {Entity} ){
  <ul all attributes>
    for( e: Entity in set order by e.name ){
      <li>
        output( e )
      </li>
    }
  </ul>
}
*/

//input( {Entity} )

template input( set: ref {Entity} ){

}
template input( set: ref {Entity}, from: [Entity] ){

}
template input( set: ref {Entity}, from: {Entity} ){

}

//input( {Entity} ) selectcheckbox

template selectcheckbox( set: ref {Entity} ){

}
template selectcheckbox( set: ref {Entity}, from: [Entity] ){

}

template inputCheckboxSetInternal( set: ref {Entity}, from: [Entity], tname: String ){

}

template inputCheckboxSetInternalHelper( set: ref {Entity}, tmpset: {Entity}, e: Entity, tname: String ){

}

//input( {Entity} ) select

template select( set: ref {Entity} ){

}
template select( set: ref {Entity}, from: [Entity] ){

}

template inputSelectMultipleInternal( set: ref {Entity}, from: [Entity], tname: String ){

}


// input(e: Entity)

template input( ent: ref Entity ){

}
template input( ent: ref Entity, from: [Entity] ){

}
template input( ent: ref Entity, from: {Entity} ){

}

//input(e:Entity) select

template select( ent: ref Entity ){

}
template select( ent: ref Entity, from: [Entity] ){

}

template inputEntityInternal( ent: ref Entity, from: [Entity], tname: String ){

}

// radio buttons input

template radio( ent: ref Entity ){

}
template radio( ent1: ref Entity, ent2: [Entity] ){

}

template radioInternal( ent1: ref Entity, ent2: [Entity], tname: String ){

}



//output(Entity)

template outputLabel( e: Entity ){

}

/*
template output( e: Entity ){
  var hasviewpage := false;
  var viewpagename := "";
  init{
    var type := e.getTypeString();
    hasviewpage := ReflectionEntity.byName( type ).hasViewPage();
    viewpagename := type.toLowerCase();
  }
  if( hasviewpage ){
    //not possible yet
    navigate ~viewpagename((~type) e){ outputLabel(e) }
  }
  else{
    outputLabel( e )
  }
}*/


//output(List)

/*
template output( list: [Entity] ){
  <ol all attributes>
    for( e:Entity in list ){
      <li>
        output( e )
      </li>
    }
  </ol>
}
*/

// input(List)

template input( list: ref [Entity] ){

}
template input( list: ref [Entity], from: {Entity} ){

}
template input( list: ref [Entity], from: [Entity] ){

}

function updateListRequest( request: String, list: [Entity], selectfrom: [Entity] ): [Entity]{

}

template inputListInternal( list: ref [Entity], selectfrom: [Entity], tname: String ){

}


//label

template labelcolumns( s: String ){

}

template label( s: String ) {

}

template labelInternal( s: String, tname: String, tc: TemplateContext ){

}


// input/output( Int )

template output( i: Int ){

}

template input( i: ref Int ){

}

template inputIntInternal( i: ref Int, tname: String ){

}

template output( d : Double ){

}

//input/output Float

template output( i: Float ){

}

template input( i: ref Float ){

}

template inputFloatInternal( i: ref Float, tname: String ){

}

//input/output Long

template output( i: Long ){

}

template input( i: ref Long ){

}

template inputLongInternal( i: ref Long, tname: String ){

}

//input/output Secret

template output( s: Secret ){

}

template input( s: ref Secret ){

}

template inputSecretInternal( s: ref Secret, tname: String ){

}

//output Placeholder

template output( p: Placeholder ){

}

//input/output String

template output( s: String ){

}

template input( s: ref String ){

}

template inputStringInternal( s: ref String, tname: String ){

}

template inputSearch( s: ref String ){

}

//input/output Text

template output( s: Text ){

}

template input( s: ref Text ){

}

template inputTextInternal( s: ref Text, tname: String ){

}


//input/output URL

template output( s: URL ){

}

template input( s: ref URL ){

}

template inputURLInternal( s: ref URL, tname: String ){

}

//input/output WikiText

template output( s: WikiText ){

}

template rawoutput( t: WikiText ){

}

template input( s: ref WikiText ){

}

template inputWikiTextInternal( s: ref WikiText, tname: String ){

}

//input/output Email

template output( s: Email ){

}

template input( s: ref Email ){

}

template inputEmailInternal( s: ref Email, tname: String ){

}

//input/output Bool

template output( b: Bool ){

}

template input( b: ref Bool ){

}

template inputBoolInternal( b: ref Bool, rname: String ){

}

//input File

template input( f: ref File ){

}


template inputFileInternal( f: ref File, tname: String ){

}

template input( f: ref [File] ){

}

template inputMultiFileInternal( f: ref [File], tname: String ){

}


//input Image


template input( i: ref Image ){

}

//validate entities

entity ValidationException{
  message: String
}
entity ValidationExceptionMultiple{
  exceptions: [ValidationException]
}

//validate template

template validate( check: Bool, message: String ){

}


// inputs with ajax validation
// @TODO address issues with template arguments to reduce code duplication

ajax template showMessages( list: [String] ){

}

ajax template noMessages(){}

template inputajax( b: ref Bool ){

}

function checkFloatWellformedness( req: String ): [String]{

}
template inputajax( f: ref Float ){

}

function checkIntWellformedness( req: String ): [String]{

}
template inputajax( i: ref Int ){

}

function checkLongWellformedness( req: String ): [String]{

}
template inputajax( l: ref Long ){

}

template inputajax( s: ref Secret ){

}
template inputajax( s: ref URL ){

}

function checkURLWellformedness( req: String ): [String]{

}

template inputajax( s: ref Text ){

}
template inputajax( s: ref WikiText ){

}
template inputajax( s: ref String ){

}
function checkEmailWellformedness( req: String ): [String]{

}
template inputajax( s: ref Email ){

}

template inputajax( set: ref {Entity} ){

}
template inputajax( set: ref {Entity}, from: [Entity] ){

}
template inputajax( set: ref {Entity}, from: {Entity} ){

}
template selectcheckboxajax( set: ref {Entity} ){

}
template selectcheckboxajax( set: ref {Entity}, from: [Entity] ){

}
template selectajax( ent: ref {Entity} ){

}
template selectajax( set: ref {Entity}, from: [Entity] ){

}

template inputajax( ent: ref Entity ){

}
template inputajax( ent: ref Entity, from: [Entity] ){

}
template inputajax( ent: ref Entity, from: {Entity} ){

}
template selectajax( ent: ref Entity ){

}
template selectajax( ent: ref Entity, from: [Entity] ){

}

template radioajax( ent: ref Entity ){

}
template radioajax( ent1: ref Entity, ent2: [Entity] ){

}

template inputajax( ent: ref [Entity] ){

}
template inputajax( ent: ref [Entity], from: {Entity} ){

}
template inputajax( list: ref [Entity], from: [Entity] ){

}

//failed action lookup message

//gets displayed on failed actions (only for ajax)
template actionFailureMessage( msg : String ){

}

//validation message templates

template errorTemplateInput( messages: [String] ){

}

template errorTemplateForm( messages: [String] ){

}

template errorTemplateAction( messages: [String] ){

}

template templateSuccess( messages: [String] ){

}

template messages(){

}

//execute the given javascript when document is ready, _and_ after ajax replace
//the passed node is either the document or the replacement node when using ajax
template postProcess(jsAsString : String){

}

//page description

template description(){

}

//page not found page

page pagenotfound(){

}

//access denied page

page accessDenied(){

}
