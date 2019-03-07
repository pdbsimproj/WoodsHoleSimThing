<map version="freeplane 1.2.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="Simulation Engine" ID="ID_1723255651" CREATED="1283093380553" MODIFIED="1550155296111" LINK="https:/github.com/pdbsimproj/WoodsHoleSimThing"><hook NAME="MapStyle">

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node">
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right">
<stylenode LOCALIZED_TEXT="default" MAX_WIDTH="600" COLOR="#000000" STYLE="as_parent">
<font NAME="SansSerif" SIZE="10" BOLD="false" ITALIC="false"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.note"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="right">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.important">
<icon BUILTIN="yes"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#0033ff">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#00b439">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#990000">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#111111">
<font SIZE="10"/>
</stylenode>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="AutomaticEdgeColor" COUNTER="11"/>
<richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <h3 content="text/html; charset=utf-8" style="white-space: normal; margin-bottom: 16px; font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol; background-color: rgb(255, 255, 255); font-style: normal; margin-top: 24px; font-size: 1.25em; text-align: start; word-spacing: 0px; font-weight: 600; line-height: 1.25; color: rgb(36, 41, 46); text-indent: 0px; letter-spacing: normal; text-transform: none" http-equiv="content-type">
      USES
    </h3>
    <ol style="white-space: normal; margin-bottom: 16px; font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol; background-color: rgb(255, 255, 255); font-style: normal; margin-top: 0px; font-size: 16px; text-align: start; word-spacing: 0px; font-weight: 400; color: rgb(36, 41, 46); text-indent: 0px; padding-left: 0; letter-spacing: normal; text-transform: none">
      <li>
        Assessment Model Testing
      </li>
      <li style="margin-top: 0">
        Sampling Request Testing
      </li>
      <li style="margin-top: 0">
        Spatial Dynamics
      </li>
      <li style="margin-top: 0">
        MSE Capability
      </li>
      <li style="margin-top: 0">
        HCR
      </li>
      <li style="margin-top: 0">
        PDT &#8211; Risk Policy Development
      </li>
      <li style="margin-top: 0">
        Ensemble
      </li>
      <li style="margin-top: 0">
        Testing Environmental Drivers
      </li>
    </ol>
  </body>
</html>

</richcontent>
<hook NAME="FirstGroupNode"/>
<node TEXT="Inputs" POSITION="right" ID="ID_1537202042" CREATED="1550155305312" MODIFIED="1550155314173">
<edge COLOR="#00ffff"/>
<node TEXT="Read Input Files" ID="ID_399575526" CREATED="1550155347185" MODIFIED="1550156011653">
<node TEXT="ASAP" ID="ID_1690771957" CREATED="1550155404918" MODIFIED="1550155408781"/>
<node TEXT="SAM" ID="ID_1357763161" CREATED="1550155412865" MODIFIED="1550155746285"/>
<node TEXT="VPA" ID="ID_1635601773" CREATED="1550155420178" MODIFIED="1550155726548"/>
<node TEXT="Other?" ID="ID_97616515" CREATED="1550155429154" MODIFIED="1550155743900"/>
<node TEXT="Use and Existing Setup From Previous Run" ID="ID_1492666221" CREATED="1550155766945" MODIFIED="1550155940446"/>
<node TEXT="Create New (GUI?)" ID="ID_1139987863" CREATED="1550155942897" MODIFIED="1550155956734"/>
</node>
<node TEXT="Setup Operating Model" ID="ID_752957169" CREATED="1550155379601" MODIFIED="1550156032318">
<node TEXT="Define Dimensions" ID="ID_1646591601" CREATED="1550156034833" MODIFIED="1550156069230">
<node TEXT="Age/Length" ID="ID_38233171" CREATED="1550156332145" MODIFIED="1550156346302">
<node TEXT="nAgesOM" ID="ID_203049871" CREATED="1551106772028" MODIFIED="1551107128201">
<edge COLOR="#ff1600"/>
<cloud COLOR="#f0f0f0" SHAPE="RECT"/>
<node TEXT="number of ages simulated by OM [integer]" ID="ID_1737292155" CREATED="1551107138348" MODIFIED="1551107152334"/>
</node>
<node TEXT="nLengthsOM" ID="ID_1084952713" CREATED="1551106781276" MODIFIED="1551107128202">
<edge COLOR="#ff1600"/>
<cloud COLOR="#f0f0f0" SHAPE="RECT"/>
<node TEXT="number of lengths simulated by OM [integer]" ID="ID_394777739" CREATED="1551107153900" MODIFIED="1551107161689"/>
</node>
</node>
<node TEXT="Time Step" ID="ID_1783857665" CREATED="1550156349089" MODIFIED="1550156364249">
<node TEXT="spawnTime" ID="ID_852901312" CREATED="1551107944588" MODIFIED="1551108016819">
<edge COLOR="#ff0600"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="fraction of year elapsed prior to spawning [array: nYearsOM] (default is all years equal)" ID="ID_737841320" CREATED="1551107993511" MODIFIED="1551107993511"/>
</node>
</node>
</node>
<node TEXT="Define Population" ID="ID_1446168848" CREATED="1550156071105" MODIFIED="1551108379561">
<node TEXT="numAge" ID="ID_1571038645" CREATED="1551108415465" MODIFIED="1551108494497">
<edge COLOR="#ff0300"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="numbers of individuals at age on January 1 [array: nYearsOM x nAgesOM x nSims]" ID="ID_738886312" CREATED="1551108453723" MODIFIED="1551108453723"/>
</node>
<node TEXT="ssb" ID="ID_1164867260" CREATED="1551108426984" MODIFIED="1551108494498">
<edge COLOR="#ff0300"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="spawning stock biomass at age calculated at spawnTime [array: nYearsOM x nSims]" ID="ID_1316487957" CREATED="1551108460832" MODIFIED="1551108460832"/>
</node>
<node TEXT="jan1B" ID="ID_293106685" CREATED="1551108435766" MODIFIED="1551108494499">
<edge COLOR="#ff0300"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="population biomass calculatee on January 1 [array: nYearsOM x nSims]" ID="ID_1242569965" CREATED="1551108468504" MODIFIED="1551108468504"/>
</node>
<node TEXT="expB" ID="ID_1019866162" CREATED="1551108444522" MODIFIED="1551108494500">
<edge COLOR="#ff0300"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="exploitable biomass calculated on January 1 [array: nYearsOM x nSims]" ID="ID_707271486" CREATED="1551108476742" MODIFIED="1551108476742"/>
</node>
</node>
<node TEXT="Define Recruitment" ID="ID_561057391" CREATED="1550156083441" MODIFIED="1550156099357">
<node TEXT="Stock Recruit Relationship" ID="ID_1320137555" CREATED="1550156402145" MODIFIED="1550156414062">
<node TEXT="typeSR" ID="ID_611607155" CREATED="1551108072939" MODIFIED="1551108141727">
<edge COLOR="#ff0300"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="stock recruit function to be used [char: BevHolt, Ricker, Hockey, Geomean, etc]" ID="ID_471984453" CREATED="1551108084344" MODIFIED="1551108084344"/>
</node>
<node TEXT="parSR" ID="ID_1389487756" CREATED="1551108109549" MODIFIED="1551108141728">
<edge COLOR="#ff0300"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="parameters for stock recruit function [array: depends on typeSR]" ID="ID_1911709658" CREATED="1551108119995" MODIFIED="1551108119995"/>
</node>
</node>
</node>
<node TEXT="Define F" ID="ID_931279114" CREATED="1550156118753" MODIFIED="1550156132238">
<node TEXT="Fleets" ID="ID_686665074" CREATED="1551107215980" MODIFIED="1551108702783">
<edge COLOR="#ff0900"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="nFleet" ID="ID_417730224" CREATED="1551107252268" MODIFIED="1551107288123">
<edge COLOR="#ff0a00"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="number of fishing fleets [integer]" ID="ID_1950368004" CREATED="1551107261676" MODIFIED="1551107270985"/>
</node>
</node>
<node TEXT="catchAge" ID="ID_1652311776" CREATED="1551108595153" MODIFIED="1551108702784">
<edge COLOR="#ff0900"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="numbers of individuals caught at age each year [array: nYearsOM x nAgesOm x nSims]" ID="ID_689801720" CREATED="1551108661552" MODIFIED="1551108661552"/>
</node>
<node TEXT="totCatchN" ID="ID_1967661275" CREATED="1551108601877" MODIFIED="1551108702785">
<edge COLOR="#ff0900"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="total number of individuals caught each year [array: nYearsOM x nSims]" ID="ID_1815136290" CREATED="1551108667894" MODIFIED="1551108667894"/>
</node>
<node TEXT="totCatchB" ID="ID_1707574453" CREATED="1551108607720" MODIFIED="1551108702785">
<edge COLOR="#ff0900"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="total biomass of individuals caught each year [array: nYearsOM x nSims]" ID="ID_673530968" CREATED="1551108675239" MODIFIED="1551108675239"/>
</node>
<node TEXT="catchWgt" ID="ID_687772248" CREATED="1551108614841" MODIFIED="1551108702786">
<edge COLOR="#ff0900"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="average weight at age in the catch [array: nYearsOM x nAgesOM x nSims]" ID="ID_1733176151" CREATED="1551108683475" MODIFIED="1551108683475"/>
</node>
</node>
<node TEXT="Define M" ID="ID_707780001" CREATED="1550156135585" MODIFIED="1550156143118">
<node TEXT="natM" ID="ID_1684754755" CREATED="1551107405388" MODIFIED="1551107437927">
<edge COLOR="#ff1e00"/>
<cloud COLOR="#f0f0f0" SHAPE="RECT"/>
<node TEXT="natural mortality [array: nYearsOM x nAgesOM]" ID="ID_819629027" CREATED="1551107411916" MODIFIED="1551107422447"/>
</node>
</node>
<node TEXT="Define Selectivity" ID="ID_1187431242" CREATED="1550156145857" MODIFIED="1550156155662">
<node TEXT="Fleet(s)" ID="ID_1978416990" CREATED="1550156267457" MODIFIED="1550156281678">
<node TEXT="selxFage" ID="ID_1041078674" CREATED="1551110220137" MODIFIED="1551110291590">
<edge COLOR="#ff0900"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="fishery selectivity by age for each year [array: nYearsOM x nAgesOM]" ID="ID_1268637304" CREATED="1551110232672" MODIFIED="1551110232672"/>
</node>
<node TEXT="selxFlength" ID="ID_1935183955" CREATED="1551110242205" MODIFIED="1551110291590">
<edge COLOR="#ff0900"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="fishery selectivity by length for each year [array: nYearsOM x nLengthsOM]" ID="ID_157132253" CREATED="1551110250064" MODIFIED="1551110250064"/>
</node>
</node>
<node TEXT="Surveys(s)" ID="ID_1792840450" CREATED="1550156284209" MODIFIED="1550156299357">
<node TEXT="selxIage" ID="ID_1997615053" CREATED="1551110257760" MODIFIED="1551110291591">
<edge COLOR="#ff0900"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="survey selectivity by age for each year [array: nYearsOM x nAgesOM]" ID="ID_1679673133" CREATED="1551110271505" MODIFIED="1551110271505"/>
</node>
<node TEXT="selxIlength" ID="ID_1318960916" CREATED="1551110264266" MODIFIED="1551110291591">
<edge COLOR="#ff0900"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="survey selectivity by length for each year [array: nYearsOM x nLengthsOM]" ID="ID_328282360" CREATED="1551110278212" MODIFIED="1551110278212"/>
</node>
</node>
</node>
<node TEXT="Define Indices" ID="ID_916041050" CREATED="1550156158737" MODIFIED="1550156169310">
<node TEXT="Abundance" ID="ID_132006037" CREATED="1550156641729" MODIFIED="1550156655214">
<node TEXT="nInd" ID="ID_1873717022" CREATED="1551106843804" MODIFIED="1551106958345">
<edge COLOR="#ff1300"/>
<cloud COLOR="#f0f0f0" SHAPE="RECT"/>
<node TEXT="number of indices [integer]" ID="ID_1217658890" CREATED="1551106874908" MODIFIED="1551106887257"/>
</node>
</node>
<node TEXT="Length Composition" ID="ID_1362193066" CREATED="1550156657617" MODIFIED="1550156668846">
<node TEXT="indLength" ID="ID_644100964" CREATED="1551110585903" MODIFIED="1551110607896">
<edge COLOR="#ff0006"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="numbers of individuals at length in survey each year [array: nYearsOM x nLengthsOm x nSims]" ID="ID_1293889341" CREATED="1551110593844" MODIFIED="1551110593844"/>
</node>
</node>
<node TEXT="Age Composition" ID="ID_1831259012" CREATED="1550156670465" MODIFIED="1550156681311">
<node TEXT="indAge" ID="ID_1791645652" CREATED="1551110572725" MODIFIED="1551110607896">
<edge COLOR="#ff0006"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="numbers of individuals at age in survey each year [array: nYearsOM x nAgesOm x nSims]" ID="ID_1075009647" CREATED="1551110579451" MODIFIED="1551110579451"/>
</node>
</node>
</node>
<node TEXT="Age/Length Weight Relationship" ID="ID_105789589" CREATED="1550157060390" MODIFIED="1550157088478">
<node TEXT="Constant" ID="ID_1729528685" CREATED="1550157092017" MODIFIED="1550157098334">
<node TEXT="" ID="ID_1760649291" CREATED="1551107595148" MODIFIED="1551107595148">
<node TEXT="lenWgt" ID="ID_1398767318" CREATED="1551107560028" MODIFIED="1551107699603">
<edge COLOR="#ff1b00"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="" ID="ID_1386389170" CREATED="1551107653804" MODIFIED="1551107653804">
<node TEXT="length weight relationship [array: nYearsOM x 2] (default is all years equal)" ID="ID_1846251335" CREATED="1551107585319" MODIFIED="1551107585319"/>
</node>
</node>
</node>
</node>
<node TEXT="Time Varying" ID="ID_448629146" CREATED="1550157099937" MODIFIED="1550157105806">
<node TEXT="lenWgt" ID="ID_1688630121" CREATED="1551107560028" MODIFIED="1551107699605">
<edge COLOR="#ff1b00"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="" ID="ID_1779256694" CREATED="1551107584575" MODIFIED="1551107584575">
<node TEXT="length weight relationship [array: nYearsOM x 2]" ID="ID_1859475256" CREATED="1551107585319" MODIFIED="1551107676283"/>
</node>
</node>
</node>
</node>
<node TEXT="Growth" ID="ID_1972322941" CREATED="1551107495480" MODIFIED="1551107499513">
<node TEXT="VonBert" ID="ID_574172354" CREATED="1551107508556" MODIFIED="1551107522489">
<node TEXT="vonB" ID="ID_1244439432" CREATED="1551107526236" MODIFIED="1551107699607">
<edge COLOR="#ff1b00"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="von Bertalanffy parameters [array: nYearsOM x 3] (default is all years equal)" ID="ID_1548991530" CREATED="1551107533292" MODIFIED="1551107543065"/>
</node>
</node>
</node>
<node TEXT="Maturity" ID="ID_658751096" CREATED="1550157111345" MODIFIED="1550157122190">
<node TEXT="Constant" ID="ID_1262756576" CREATED="1550157124801" MODIFIED="1550157165630">
<node TEXT="matAge" ID="ID_1122764313" CREATED="1551107732940" MODIFIED="1551107932271">
<edge COLOR="#ff1200"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="maturity at age [array: nYearsOM x nAgesOM]" ID="ID_296334464" CREATED="1551107741117" MODIFIED="1551107751881"/>
</node>
</node>
<node TEXT="Time Varying" ID="ID_1096703878" CREATED="1550157140561" MODIFIED="1550157156494">
<node TEXT="matAge" ID="ID_1382837633" CREATED="1551107797788" MODIFIED="1551107932272">
<edge COLOR="#ff1200"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="maturity at age [array: nYearsOM x nAgesOM]" ID="ID_1095534631" CREATED="1551107741117" MODIFIED="1551107751881"/>
</node>
</node>
</node>
<node TEXT="Specify Observation Error" ID="ID_1654398859" CREATED="1550156179057" MODIFIED="1550156196318">
<node TEXT="obsErrorFtype" ID="ID_1777604456" CREATED="1551110638009" MODIFIED="1551110765496">
<edge COLOR="#ff0600"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="observation error structure for each Fleet [vector: nFleet] (default is non-autocorrelated lognormal)" ID="ID_1124526599" CREATED="1551110667578" MODIFIED="1551110667578"/>
</node>
<node TEXT="obsErrorItype" ID="ID_822625137" CREATED="1551110646422" MODIFIED="1551110765496">
<edge COLOR="#ff0600"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="observation error structure for each Survey [vector: nSurvey] (default is non-autocorrelated lognormal)" ID="ID_205323349" CREATED="1551110674660" MODIFIED="1551110674660"/>
</node>
<node TEXT="obsErrorF" ID="ID_41655906" CREATED="1551110652500" MODIFIED="1551110765497">
<edge COLOR="#ff0600"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="observation error in F each year [array: nYearsOM x nSims] (default is constant in time)" ID="ID_1659147019" CREATED="1551110681278" MODIFIED="1551110681278"/>
</node>
<node TEXT="obsErrorI" ID="ID_547021286" CREATED="1551110658362" MODIFIED="1551110765497">
<edge COLOR="#ff0600"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="observation error in Index each year [array: nYearsOM x nSims] (default is constant in time)" ID="ID_1685576112" CREATED="1551110687612" MODIFIED="1551110687612"/>
</node>
</node>
<node TEXT="Specify Process Error" ID="ID_493049523" CREATED="1550156198705" MODIFIED="1550156210398">
<node TEXT="procErrorFtype" ID="ID_1438121466" CREATED="1551110701655" MODIFIED="1551110765498">
<edge COLOR="#ff0600"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="process error structure for each Fleet [vector: nFleet] (default is non-autocorrelated lognormal)" ID="ID_425029705" CREATED="1551110729897" MODIFIED="1551110729897"/>
</node>
<node TEXT="procErrorItype" ID="ID_940125565" CREATED="1551110709182" MODIFIED="1551110765499">
<edge COLOR="#ff0600"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="process error structure for each Survey [vector: nSurvey] (default is non-autocorrelated lognormal)" ID="ID_1085289409" CREATED="1551110736477" MODIFIED="1551110736477"/>
</node>
<node TEXT="procErrorF" ID="ID_1219287044" CREATED="1551110715359" MODIFIED="1551110765499">
<edge COLOR="#ff0600"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="process error in F each year [array: nYearsOM x nSims] (default is constant in time)" ID="ID_1302850287" CREATED="1551110743214" MODIFIED="1551110743214"/>
</node>
<node TEXT="procErrorI" ID="ID_1896514649" CREATED="1551110720825" MODIFIED="1551110765500">
<edge COLOR="#ff0600"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="process error in Index each year [array: nYearsOM x nSims] (default is constant in time)" ID="ID_1668930054" CREATED="1551110750489" MODIFIED="1551110750489"/>
</node>
</node>
<node TEXT="Specify Projection Years" ID="ID_1318306512" CREATED="1550157503121" MODIFIED="1550157515230">
<node TEXT="Control Rules" ID="ID_156651670" CREATED="1550157520241" MODIFIED="1550157534942"/>
<node TEXT="Conditions (time varying parameters)" ID="ID_367390263" CREATED="1550157537185" MODIFIED="1550157555070"/>
</node>
<node TEXT="Initialize Simulation Run" ID="ID_126427768" CREATED="1551106356386" MODIFIED="1551106387449">
<node TEXT="rSeed" ID="ID_1841630323" CREATED="1551106390620" MODIFIED="1551106577113">
<edge COLOR="#ff1900"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="random number seed [integer]" ID="ID_1379242500" CREATED="1551106977372" MODIFIED="1551106992025"/>
</node>
<node TEXT="runName" ID="ID_969202161" CREATED="1551106399452" MODIFIED="1551106577115">
<edge COLOR="#ff1900"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="prefix to pre-pend to output files [character]" ID="ID_114719562" CREATED="1551106996364" MODIFIED="1551107006969"/>
</node>
<node TEXT="runNote" ID="ID_1505049197" CREATED="1551106407836" MODIFIED="1551106577116">
<edge COLOR="#ff1900"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="text string that describes run, will be included in list output [character]" ID="ID_1482484981" CREATED="1551107011020" MODIFIED="1551107018597"/>
</node>
<node TEXT="nSims" ID="ID_1447363398" CREATED="1551106685309" MODIFIED="1551106757957">
<edge COLOR="#ff0006"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="number of simulated data sets  [integer]" ID="ID_105652172" CREATED="1551107020588" MODIFIED="1551107028985"/>
</node>
<node TEXT="nYearsOM" ID="ID_318766210" CREATED="1551106721948" MODIFIED="1551106757955">
<edge COLOR="#ff0006"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
<node TEXT="number of years simulated by OM [integer] (depending on flags checked above, we could have nYearsEM, etc..)" ID="ID_392646190" CREATED="1551107031468" MODIFIED="1551107038899"/>
</node>
</node>
</node>
<node TEXT="Scenarios" ID="ID_927630673" CREATED="1550156730471" MODIFIED="1550156743518">
<node TEXT="Control Rule" ID="ID_1919810116" CREATED="1550156744961" MODIFIED="1550156789886"/>
<node TEXT="Time Varying Conditions" ID="ID_1421557351" CREATED="1550156792353" MODIFIED="1550156810638"/>
<node TEXT="Other Stuff (lots)" ID="ID_1816344145" CREATED="1550156812529" MODIFIED="1550156820734"/>
<node TEXT="Projection Year Conditions" ID="ID_1119209484" CREATED="1550157486210" MODIFIED="1550157496686"/>
</node>
</node>
<node TEXT="Population Dynmaics" POSITION="left" ID="ID_484325255" CREATED="1550156833026" MODIFIED="1550156842894">
<edge COLOR="#ffff00"/>
<node TEXT="Survival" ID="ID_728892046" CREATED="1550156845201" MODIFIED="1550156855198"/>
<node TEXT="Recruitment" ID="ID_718466430" CREATED="1550156857793" MODIFIED="1550156867678"/>
<node TEXT="Catch" ID="ID_1309685219" CREATED="1550156869377" MODIFIED="1550156875886">
<node TEXT="Implementation Error" ID="ID_129956222" CREATED="1550157310690" MODIFIED="1550157316734"/>
</node>
<node TEXT="Indices" ID="ID_25667947" CREATED="1550156877649" MODIFIED="1550156880990">
<node TEXT="Observation Error" ID="ID_711344513" CREATED="1550156882961" MODIFIED="1550156901246"/>
</node>
<node TEXT="Calculate Reference Points" ID="ID_1820030637" CREATED="1550156923922" MODIFIED="1550156938254">
<node TEXT="MSY" ID="ID_218167390" CREATED="1550157204689" MODIFIED="1550157207214"/>
<node TEXT="BMSY" ID="ID_289558141" CREATED="1550157209105" MODIFIED="1550157231422"/>
<node TEXT="FMSY" ID="ID_1566118451" CREATED="1550157237137" MODIFIED="1550157240718"/>
</node>
<node TEXT="Apply Control Rule" ID="ID_1545180628" CREATED="1550157280321" MODIFIED="1550157299486"/>
</node>
<node TEXT="Management Projection" POSITION="right" ID="ID_109961221" CREATED="1550157348002" MODIFIED="1550157364446">
<edge COLOR="#00007c"/>
<node TEXT="Calculate Stock Status" ID="ID_710750855" CREATED="1550157366817" MODIFIED="1550157381902">
<node TEXT="Short Cut Method (no stock assessment model)" ID="ID_1107820629" CREATED="1550157383569" MODIFIED="1550157408238"/>
<node TEXT="ASAP" ID="ID_789033051" CREATED="1550157409969" MODIFIED="1550157414606"/>
<node TEXT="VPA" ID="ID_858141539" CREATED="1550157424897" MODIFIED="1550157427406"/>
<node TEXT="SAM" ID="ID_1968953164" CREATED="1550157429425" MODIFIED="1550157432542"/>
<node TEXT="Other" ID="ID_382877809" CREATED="1550157434337" MODIFIED="1550157437790"/>
</node>
<node TEXT="Control Rule" ID="ID_1678655977" CREATED="1550157442257" MODIFIED="1550157462798"/>
<node TEXT="Project Forward" ID="ID_1295930992" CREATED="1550157466050" MODIFIED="1550157471454"/>
</node>
<node TEXT="Run Simulations" POSITION="left" ID="ID_749711520" CREATED="1550157588498" MODIFIED="1550157605246">
<edge COLOR="#007c00"/>
<node TEXT="Single Stock Assessment Model" ID="ID_609310991" CREATED="1550157606737" MODIFIED="1550157621630"/>
<node TEXT="All Stock Assesment Models" ID="ID_506304096" CREATED="1550157623361" MODIFIED="1550157630798"/>
<node TEXT="Scenarios" ID="ID_387235440" CREATED="1550157633009" MODIFIED="1550157640382"/>
</node>
<node TEXT="Summarizing Functions" POSITION="right" ID="ID_374054897" CREATED="1550157642945" MODIFIED="1550157655502">
<edge COLOR="#7c007c"/>
<node TEXT="Tables" ID="ID_488801423" CREATED="1550157657505" MODIFIED="1550157670766">
<node TEXT="SSB" ID="ID_216937396" CREATED="1550157687969" MODIFIED="1550157694862"/>
<node TEXT="F" ID="ID_1195227401" CREATED="1550157699169" MODIFIED="1550157701614"/>
<node TEXT="Reference Points" ID="ID_1798959093" CREATED="1550157704785" MODIFIED="1550157712958"/>
<node TEXT="Observed vs. Truth" ID="ID_1519632842" CREATED="1550157720001" MODIFIED="1550157730206"/>
<node TEXT="Etc..." ID="ID_1533049985" CREATED="1550157732209" MODIFIED="1550157737038"/>
</node>
<node TEXT="Figures" ID="ID_720022662" CREATED="1550157672209" MODIFIED="1550157675614">
<node TEXT="Gonna be a lot!" ID="ID_227275542" CREATED="1550157679217" MODIFIED="1550157685134"/>
</node>
</node>
<node TEXT="Utility Functions" POSITION="left" ID="ID_1407375418" CREATED="1550157812801" MODIFIED="1550157826078">
<edge COLOR="#007c7c"/>
<node TEXT="Add Error" ID="ID_953799041" CREATED="1550157828370" MODIFIED="1550157834526">
<node TEXT="Lognormal" ID="ID_1900495470" CREATED="1550157836209" MODIFIED="1550157842414"/>
<node TEXT="Auto Correlated" ID="ID_423373112" CREATED="1550157844401" MODIFIED="1550157849614"/>
</node>
<node TEXT="Data Manipulation" ID="ID_620467011" CREATED="1550157886290" MODIFIED="1550157896414">
<node TEXT="Fill Matrices" ID="ID_1696405659" CREATED="1550157897585" MODIFIED="1550157906926"/>
<node TEXT="change class" ID="ID_1378336755" CREATED="1550159183282" MODIFIED="1550159188878"/>
<node TEXT="Replace missing values" ID="ID_222025953" CREATED="1550159190578" MODIFIED="1550159198926"/>
</node>
<node TEXT="Error Checking" ID="ID_1512307133" CREATED="1550157932257" MODIFIED="1550157937966">
<node TEXT="Class Comparisons" ID="ID_883854244" CREATED="1550157939681" MODIFIED="1550157952270"/>
<node TEXT="Dimension Checking" ID="ID_120926528" CREATED="1550157954225" MODIFIED="1550157959582"/>
<node TEXT="Impossible Biology" ID="ID_1350060160" CREATED="1550157965649" MODIFIED="1550157972878"/>
<node TEXT="Extinction or other 0 conditions" ID="ID_499852064" CREATED="1550157976241" MODIFIED="1550157993022"/>
<node TEXT="0 Boundary violations (negative MSY etc)" ID="ID_1175188220" CREATED="1550158003010" MODIFIED="1550158044014"/>
<node TEXT="Runaway Population?" ID="ID_1789897022" CREATED="1550158046225" MODIFIED="1550158793182"/>
</node>
<node TEXT="Math" ID="ID_1679188647" CREATED="1550158804274" MODIFIED="1550158807806">
<node TEXT="Transformations" ID="ID_1564853431" CREATED="1550158818466" MODIFIED="1550158823438"/>
<node TEXT="Calculation of Confidence Bounds" ID="ID_108799562" CREATED="1550159226434" MODIFIED="1550159238254"/>
<node TEXT="Statistics" ID="ID_1631398101" CREATED="1550159240402" MODIFIED="1550159263806"/>
</node>
<node TEXT="Graphics Control" ID="ID_1977856204" CREATED="1550158894788" MODIFIED="1550158901950">
<node TEXT="format" ID="ID_1830439699" CREATED="1550158903506" MODIFIED="1550158908606"/>
<node TEXT="Resolution" ID="ID_1677523163" CREATED="1550158910562" MODIFIED="1550158915678"/>
<node TEXT="Plots per page" ID="ID_283450847" CREATED="1550158918098" MODIFIED="1550158926222"/>
</node>
<node TEXT="File Manipulation" ID="ID_1012302484" CREATED="1550158982613" MODIFIED="1550158990398">
<node TEXT="Replace text in all files" ID="ID_1072887213" CREATED="1550158991858" MODIFIED="1550159002958"/>
<node TEXT="Replace block text in all files" ID="ID_258324469" CREATED="1550159012162" MODIFIED="1550159049310"/>
<node TEXT="Create Output Directories" ID="ID_183858770" CREATED="1550159064274" MODIFIED="1550159075326"/>
<node TEXT="Set paths" ID="ID_948985440" CREATED="1550159080834" MODIFIED="1550159087518"/>
</node>
<node TEXT="Debugging" ID="ID_942640802" CREATED="1550159092998" MODIFIED="1550159108078">
<node TEXT="Performance benchmarking" ID="ID_1937762879" CREATED="1550159111122" MODIFIED="1550159137166"/>
<node TEXT="Error flagging and Reporting" ID="ID_1044664985" CREATED="1550159143490" MODIFIED="1550159150926"/>
</node>
</node>
</node>
</map>
