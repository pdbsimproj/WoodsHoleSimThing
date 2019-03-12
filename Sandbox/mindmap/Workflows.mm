<map version="freeplane 1.7.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="Workflow 1: Test ASAP" FOLDED="false" ID="ID_683696728" CREATED="1552410255151" MODIFIED="1552410962472" STYLE="oval">
<font SIZE="18"/>
<hook NAME="MapStyle" layout="OUTLINE">
    <properties edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff" fit_to_viewport="false" show_icon_for_attributes="true" show_note_icons="true"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24.0 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" ICON_SIZE="12.0 pt" COLOR="#000000" STYLE="fork">
<font NAME="SansSerif" SIZE="10" BOLD="false" ITALIC="false"/>
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
<stylenode LOCALIZED_TEXT="styles.important">
<icon BUILTIN="yes"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000" STYLE="oval" SHAPE_HORIZONTAL_MARGIN="10.0 pt" SHAPE_VERTICAL_MARGIN="10.0 pt">
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
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,5"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,6"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,7"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,8"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,9"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,10"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,11"/>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="AutomaticEdgeColor" COUNTER="18" RULE="ON_BRANCH_CREATION"/>
<node TEXT="1. Get starting point" POSITION="right" ID="ID_696632184" CREATED="1552410283250" MODIFIED="1552412311042">
<edge COLOR="#ff0000"/>
<node TEXT="Read WHSimThing file" ID="ID_402395566" CREATED="1552412319043" MODIFIED="1552412336713"/>
<node TEXT="Read ASAP, VPA, or SAM and convert to WHSimThing structure" ID="ID_1571782901" CREATED="1552412340000" MODIFIED="1552412357983"/>
</node>
<node TEXT="2. Modify settings, e.g., change M, include missing catch, change q, add fleet, change selectivity, etc." POSITION="left" ID="ID_1842072730" CREATED="1552410392011" MODIFIED="1552412483234">
<edge COLOR="#00ffff"/>
<node TEXT="Save the new decisions in WHSimThing format" ID="ID_743379729" CREATED="1552411203277" MODIFIED="1552411231619"/>
</node>
<node TEXT="3. Create operating model truth" POSITION="left" ID="ID_1070697040" CREATED="1552410470415" MODIFIED="1552410528793">
<edge COLOR="#7c0000"/>
</node>
<node TEXT="4. Create observations with known error properties" POSITION="left" ID="ID_624199726" CREATED="1552410532647" MODIFIED="1552410557158">
<edge COLOR="#007c00"/>
<node TEXT="Requires making decisions and saving in WHSimThing format" ID="ID_328830207" CREATED="1552413597853" MODIFIED="1552413615278"/>
</node>
<node TEXT="5. Run ASAP and collect important output" POSITION="right" ID="ID_628282800" CREATED="1552410560746" MODIFIED="1552410577518">
<edge COLOR="#7c007c"/>
<node TEXT="Need to define input settings for ASAP somewhere, should be easy to match truth if desired or modify from true values, want to save these choices in WHSimThing structure as well" ID="ID_242259886" CREATED="1552412875056" MODIFIED="1552412944109"/>
</node>
<node TEXT="6. Repeat steps 4-5 many times" POSITION="left" ID="ID_1623932008" CREATED="1552410579546" MODIFIED="1552410595143">
<edge COLOR="#007c7c"/>
</node>
<node TEXT="7. Summarize results comparing ASAP estimates to true values" POSITION="right" ID="ID_1759827608" CREATED="1552410597896" MODIFIED="1552410618556">
<edge COLOR="#7c7c00"/>
</node>
<node TEXT="8. Save results" POSITION="left" ID="ID_665286663" CREATED="1552410886525" MODIFIED="1552410906277">
<edge COLOR="#00ff00"/>
</node>
<node TEXT="Workflow 2: MSE" LOCALIZED_STYLE_REF="defaultstyle.floating" POSITION="right" ID="ID_1330201668" CREATED="1552411106674" MODIFIED="1552411129564" HGAP_QUANTITY="264.7499921098354 pt" VSHIFT_QUANTITY="0.0 pt">
<hook NAME="FreeNode"/>
<node TEXT="1. Get starting point (same as above)" ID="ID_936300270" CREATED="1552411181938" MODIFIED="1552412450036"/>
<node TEXT="2. Modify settings and save in WHSimThing format" ID="ID_854494212" CREATED="1552411351609" MODIFIED="1552411375106"/>
<node TEXT="3. Set up MSE settings, e.g., nProjYear, control rule, skip year, etc. and save in WHSimThing format" ID="ID_1925647856" CREATED="1552411390108" MODIFIED="1552412515095">
<node TEXT="Should be easy to run with same settings for a number of different control rules" ID="ID_283340977" CREATED="1552414087224" MODIFIED="1552414108964"/>
</node>
<node TEXT="4. Create initial operating model truth" ID="ID_159852802" CREATED="1552412538697" MODIFIED="1552412559846"/>
<node TEXT="5. Create observations with known error properties" ID="ID_1833706847" CREATED="1552412563242" MODIFIED="1552412581276"/>
<node TEXT="6. Run assessment model" ID="ID_176595840" CREATED="1552412585015" MODIFIED="1552412596648"/>
<node TEXT="7. Apply control rule to determine future harvest" ID="ID_1926088333" CREATED="1552412600689" MODIFIED="1552412613729"/>
<node TEXT="8. Remove harvest from true population according to MSE settings" ID="ID_1181993937" CREATED="1552412616591" MODIFIED="1552412647015"/>
<node TEXT="9. Repeat steps 5-8 until reach nProjYear" ID="ID_1951205869" CREATED="1552412671209" MODIFIED="1552412701632"/>
<node TEXT="10. Repeat steps 4-9 many times" ID="ID_741702204" CREATED="1552412704549" MODIFIED="1552412767694"/>
<node TEXT="11. Summarize results comparing estimates to true values and stats such as avg catch, min SSB, etc. to compare to other control rules" ID="ID_610810843" CREATED="1552412771372" MODIFIED="1552414065589"/>
<node TEXT="12. Save results" ID="ID_363031548" CREATED="1552412783330" MODIFIED="1552412790395"/>
</node>
<node TEXT="Overarching thoughts" LOCALIZED_STYLE_REF="defaultstyle.floating" POSITION="right" ID="ID_1003084427" CREATED="1552414170453" MODIFIED="1552414184523" HGAP_QUANTITY="264.7499921098354 pt" VSHIFT_QUANTITY="0.0 pt">
<hook NAME="FreeNode"/>
<node TEXT="How keep this repeatable, want to be able to send rdat or some such file to someone else and have them get same results - need random seed setting and all user input saved" ID="ID_1047983712" CREATED="1552414189317" MODIFIED="1552414239193"/>
<node TEXT="Not sure how much we want to run through Shiny versus run through R command lines" ID="ID_1556503677" CREATED="1552414249945" MODIFIED="1552414282052"/>
<node TEXT="Should we worry about parrellelization from the get go, or deal with it later?" ID="ID_103864474" CREATED="1552414288149" MODIFIED="1552414316805"/>
</node>
</node>
</map>
