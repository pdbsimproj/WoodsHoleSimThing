<map version="freeplane 1.7.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="Age Structured Version" FOLDED="false" ID="ID_1064534604" CREATED="1549485558165" MODIFIED="1549489148210" STYLE="oval">
<font SIZE="15"/>
<hook NAME="MapStyle">
    <conditional_styles>
        <conditional_style ACTIVE="true" LOCALIZED_STYLE_REF="styles.connection" LAST="false">
            <node_periodic_level_condition PERIOD="2" REMAINDER="1"/>
        </conditional_style>
        <conditional_style ACTIVE="true" LOCALIZED_STYLE_REF="styles.topic" LAST="false">
            <node_level_condition VALUE="2" MATCH_CASE="false" MATCH_APPROXIMATELY="false" COMPARATION_RESULT="0" SUCCEED="true"/>
        </conditional_style>
        <conditional_style ACTIVE="true" LOCALIZED_STYLE_REF="styles.subtopic" LAST="false">
            <node_level_condition VALUE="4" MATCH_CASE="false" MATCH_APPROXIMATELY="false" COMPARATION_RESULT="0" SUCCEED="true"/>
        </conditional_style>
        <conditional_style ACTIVE="true" LOCALIZED_STYLE_REF="styles.subsubtopic" LAST="false">
            <node_level_condition VALUE="6" MATCH_CASE="false" MATCH_APPROXIMATELY="false" COMPARATION_RESULT="0" SUCCEED="true"/>
        </conditional_style>
    </conditional_styles>
    <properties edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff" fit_to_viewport="false" show_note_icons="true" show_icon_for_attributes="true"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24.0 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" ICON_SIZE="12.0 pt" COLOR="#000000" STYLE="fork">
<font NAME="Arial" SIZE="10" BOLD="false" ITALIC="false"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes">
<font SIZE="9"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note" COLOR="#000000" BACKGROUND_COLOR="#ffffff" TEXT_ALIGN="LEFT"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.connection" COLOR="#606060" STYLE="fork">
<font NAME="Arial" SIZE="8" BOLD="false"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000" STYLE="oval">
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
<node TEXT="Initial setup" LOCALIZED_STYLE_REF="styles.subtopic" POSITION="right" ID="ID_754843804" CREATED="1549487119819" MODIFIED="1549489102090" HGAP_QUANTITY="25.999999642372142 pt" VSHIFT_QUANTITY="-104.99999687075625 pt">
<icon BUILTIN="full-1"/>
<node TEXT="set random seed" ID="ID_1839179291" CREATED="1549487141412" MODIFIED="1549487470642">
<font SIZE="12"/>
<richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      rseed
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="add descriptive comment for run {this could be a string (run.comment) that gets put at the top of a list with OM output}" ID="ID_1149201000" CREATED="1549487158613" MODIFIED="1549487646188">
<font SIZE="12"/>
</node>
<node TEXT="deal with directory structure?" ID="ID_1063592373" CREATED="1549487207674" MODIFIED="1549487290628">
<font SIZE="12"/>
</node>
<node TEXT="turn on/off features and intended use" ID="ID_1413417321" CREATED="1549487223502" MODIFIED="1549487290629">
<font SIZE="12"/>
<node TEXT="output format" ID="ID_1006600759" CREATED="1549487243226" MODIFIED="1549487290580">
<font SIZE="12"/>
<node TEXT="save plots (T/F)" ID="ID_19947828" CREATED="1549487647110" MODIFIED="1549487679702"/>
<node TEXT="png/jpg/etc" ID="ID_311008072" CREATED="1549487680695" MODIFIED="1549487682998"/>
</node>
<node TEXT="create assmt model input files" ID="ID_601649792" CREATED="1549487318656" MODIFIED="1549487346525">
<font SIZE="11"/>
<node TEXT="ASAP" ID="ID_1191730666" CREATED="1549487339288" MODIFIED="1549487341790"/>
<node TEXT="VPA" ID="ID_1780238053" CREATED="1549487352319" MODIFIED="1549487356583"/>
<node TEXT="ASPIC" ID="ID_1544287578" CREATED="1549487360479" MODIFIED="1549487364260"/>
<node TEXT="Plan B" ID="ID_390357528" CREATED="1549487376411" MODIFIED="1549487380314"/>
<node TEXT="etc.." ID="ID_1375108586" CREATED="1549487382061" MODIFIED="1549487386191"/>
</node>
</node>
<node TEXT="Name prefix for saving files" LOCALIZED_STYLE_REF="styles.subtopic" ID="ID_822411963" CREATED="1549487498190" MODIFIED="1549489113628"/>
</node>
<node TEXT="Dimensionalize" LOCALIZED_STYLE_REF="styles.subtopic" POSITION="right" ID="ID_182216599" CREATED="1549487808407" MODIFIED="1549489106433" HGAP_QUANTITY="79.24999805539852 pt" VSHIFT_QUANTITY="-111.74999666959057 pt">
<icon BUILTIN="full-2"/>
<node TEXT="number of simulations" ID="ID_151645249" CREATED="1549487970371" MODIFIED="1549488124527" TEXT_SHORTENED="true"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      n.sims&#160;&#160;OR nsims (any preference for this convention?)
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="number of years" ID="ID_348661906" CREATED="1549487997309" MODIFIED="1549488142016"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      similar decision here and elsewhere...
    </p>
    <p>
      n.years OR &#160;nyears
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="? time step (yearly or monthly)" ID="ID_1999012581" CREATED="1549488003924" MODIFIED="1549488029258"/>
<node TEXT="number of ages" ID="ID_506454357" CREATED="1549488030776" MODIFIED="1549488035811"/>
</node>
<node TEXT="Biology" LOCALIZED_STYLE_REF="styles.subtopic" POSITION="left" ID="ID_1628433798" CREATED="1549487819779" MODIFIED="1549489118855" HGAP_QUANTITY="-451.7499861195687 pt" VSHIFT_QUANTITY="105.74999684840446 pt">
<icon BUILTIN="full-3"/>
<node TEXT="Attributes" ID="ID_912479693" CREATED="1549488504443" MODIFIED="1549488834933" HGAP_QUANTITY="-117.24999608844529 pt" VSHIFT_QUANTITY="-22.499999329447768 pt">
<node TEXT="Natural mortality" ID="ID_554014996" CREATED="1549488633848" MODIFIED="1549488669493" HGAP_QUANTITY="-129.24999573081743 pt" VSHIFT_QUANTITY="-26.249999217689062 pt"/>
<node TEXT="von Bertalanffy" ID="ID_467725544" CREATED="1549488699296" MODIFIED="1549488722704" HGAP_QUANTITY="-130.74999568611395 pt" VSHIFT_QUANTITY="-28.499999150633837 pt"/>
<node TEXT="Weight at length" ID="ID_1653910616" CREATED="1549488730407" MODIFIED="1549488753527" HGAP_QUANTITY="-127.74999577552094 pt" VSHIFT_QUANTITY="-17.99999946355821 pt"/>
<node TEXT="maturity" ID="ID_1614799470" CREATED="1549488761260" MODIFIED="1549488779188" HGAP_QUANTITY="-96.24999671429404 pt" VSHIFT_QUANTITY="-2.9999999105930355 pt"/>
<node TEXT="Stock Recruitment" ID="ID_1819014216" CREATED="1549488783030" MODIFIED="1549488806556" HGAP_QUANTITY="-126.99999579787266 pt" VSHIFT_QUANTITY="12.7499996200204 pt"/>
</node>
<node TEXT="Process Error" ID="ID_1527974889" CREATED="1549488541841" MODIFIED="1549488827334" HGAP_QUANTITY="-169.74999452382343 pt" VSHIFT_QUANTITY="29.999999105930357 pt"/>
<node TEXT="Covariate Relationship" ID="ID_292862960" CREATED="1549488600168" MODIFIED="1549488630121" HGAP_QUANTITY="-180.9999941885473 pt" VSHIFT_QUANTITY="33.74999899417165 pt"/>
</node>
<node TEXT="Fishery" LOCALIZED_STYLE_REF="styles.subtopic" POSITION="left" ID="ID_1551265065" CREATED="1549489053418" MODIFIED="1549489172309" HGAP_QUANTITY="-390.9999879300598 pt" VSHIFT_QUANTITY="98.24999707192191 pt">
<icon BUILTIN="full-4"/>
<font SIZE="11"/>
</node>
<node TEXT="Surveys" LOCALIZED_STYLE_REF="styles.subtopic" POSITION="right" ID="ID_115225165" CREATED="1549489138975" MODIFIED="1549489168434" HGAP_QUANTITY="69.49999834597116 pt" VSHIFT_QUANTITY="281.24999161809706 pt">
<icon BUILTIN="full-5"/>
<font SIZE="11"/>
</node>
</node>
</map>
